#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



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
  not_if { !::File.directory?(::File.join(node[:module][:path], node[:module][:name])) }
end

directory "#{node[:module][:path]}"

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

execute 'make run script executable' do
  command "chmod u+x #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end

execute 'make module path writeable for all' do
  command "chmod -R 777 #{node[:module][:path]}"
end

execute 'make lock file writable' do
  command "chmod -R 777 /var/lock/subsys/#{node[:module][:name]}"
end

execute 'restart app' do
  command "sudo service #{node[:module][:name]} restart"
end
