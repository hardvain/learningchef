
template "/etc/init.d/#{node[:module][:name]}" do
  source 'init_script.erb'
  mode '0755'
  variables({
     :module_name => "#{node[:module][:name]}",
     :module_path => "#{node[:module][:path]}",
     :module_executable => "#{node[:module][:executable_path]}"
  })
end

package 'unzip'

directory "#{node[:module][:path]}" do
  mode '0644'
  recursive true
  action :delete
end

directory "#{node[:module][:path]}" do
  mode '0644'
end


execute 'copy from s3' do
  command "aws s3 cp s3://espoc-apps/#{node[:module][:name]}.zip #{node[:module][:path]}.zip"
end

execute 'unzip' do
  command "unzip -o #{node[:module][:path]}.zip -d #{node[:module][:path]}"
end

execute 'give access to log folder' do
  command "chmod 757 #{node[:log_path]}"
end


execute 'Make module path accessible' do
  command "chmod 757 -R #{node[:module][:path]}"
end

template "#{node[:module][:path]}/conf/config.hocon" do
  source "#{node[:module][:name]}.config.hocon.erb"
  mode '0755'
  variables(node[node[:module][:name]][:variables])
end

execute 'make run script executable' do
  command "chmod u+x #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end

execute 'start app' do
  user node[:user]
  command "service #{node[:module][:name]} restart"
end
