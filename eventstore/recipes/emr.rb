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

template "#{node[:module][:path]}/emr" do
  source 'emr.erb'
  mode '0755'
  variables({
     :cluster-id => "#{node[:module][:cluster-id]}",
     :queue-url => "#{node[:module][:queue-url]}"
  })
end

execute 'add step to emr' do
  command "sh #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh > #{node[:module][:path]}/bin/step_id"
end
