node.default[:module][:jar_location] = "s3://espoc-apps/#{node[:module][:name]}/#{node[:module][:name]}.jar" 
node.default[:module][:conf_location] = "s3://espoc-apps/#{node[:module][:name]}/config.hocon"
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


template "#{node[:module][:path]}/conf/config.hocon" do
  source "#{node[:module][:name]}.config.hocon.erb"
  mode '0755'
  variables(node[:module][:variables])
end


execute 'upload jar to s3' do
  command "aws s3 cp #{node[:module][:path]}/lib/#{node[:module][:name]}*.jar   --acl public-read-write"
end

execute 'upload config to s3' do
  command "aws s3 cp #{node[:module][:path]}/conf/config.hocon #{node[:module][:conf_location] } --acl public-read-write"
end

template "#{node[:module][:path]}/emr.sh" do
  source 'emr.erb'
  mode '0755'
  variables({
     :cluster_id => "#{node[:module][:cluster_id]}",
     :queue_url => "#{node[:module][:queue_url]}",
     :aws_region => node[:module][:aws_region]
  })
end

execute 'make run script executable' do
  command "chmod u+x #{node[:module][:path]}/emr.sh"
end

execute 'stop running steps' do
  user node[:user]
  command "#{node[:module][:path]}/emr.sh"
end


execute 'add step to emr' do
  user node[:user]
  command "sh #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh #{node[:module][:cluster_id]} #{node[:module][:jar_location]} #{node[:module][:conf_location]}"
end