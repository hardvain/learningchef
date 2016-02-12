package 'unzip'
package 'jq'

directory "#{node[:module][:path]}" do
  mode '0644'
  recursive true
  action :delete
  not_if { !::File.directory?(::File.join(node[:module][:path], node[:module][:name])) }
end

directory "#{node[:module][:path]}" do
  mode '0644'
end

remote_file "#{node[:module][:path]}.zip" do
  source "https://s3.amazonaws.com/espoc-apps/#{node[:module][:name]}.zip"
  action :create
  mode '0644'
end

execute 'unzip' do 
  command "unzip -o #{node[:module][:path]}.zip -d #{node[:module][:path]}"
end

remote_file "#{node[:module][:path]}/conf/config.hocon" do
  source "file://#{node[:module][:path]}/conf/config.hocon.sample"
end

execute 'upload jar to s3' do
  command "aws s3 cp #{node[:module][:path]}/lib/#{node[:module][:name]}*.jar s3://espoc-apps/#{node[:module][:name]}/#{node[:module][:name]}.jar --acl public-read-write"
end

execute 'upload config to s3' do
  command "aws s3 cp #{node[:module][:path]}/conf/config.hocon s3://espoc-apps/#{node[:module][:name]}/config.hocon --acl public-read-write"
end

template "#{node[:module][:path]}/emr" do
  source 'emr.erb'
  mode '0755'
  variables({
     :cluster-id => "#{node[:module][:cluster-id]}",
     :queue-url => "#{node[:module][:queue-url]}"
  })
end

execute 'make run script executable' do
  command "chmod u+x #{node[:module][:path]}/emr"
end

execute 'stop running steps' do
  command "#{node[:module][:path]}/emr"
end


execute 'add step to emr' do
  command "sh #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end
