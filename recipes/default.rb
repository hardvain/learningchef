#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
Chef::Log.level = :debug
p node[:deploy]
log 'message' do
  message 'aravindh'
  message node[:deploy]
  level :info
end
cookbook_file '/home/ec2-user/queryapi.zip' do
  source 'queryapi-0.2.0.zip'
  mode '0644'
end

cookbook_file '/etc/init.d/queryapi' do
  source 'queryapi'
  mode '0755'
end

# directory '/home/ec2-user/queryapi' do
#   mode '0644'
# end
package 'unzip'

directory '/home/ec2-user/queryapi' do
  mode '0644'
  recursive true
  action :delete
  not_if { !::File.directory?(::File.join('/home/ec2-user', 'queryapi')) }
end


execute 'unzip' do
  command 'unzip -o /home/ec2-user/queryapi.zip -d /home/ec2-user/queryapi'
end

remote_file "/home/ec2-user/queryapi/conf/config.hocon" do
  source 'file:///home/ec2-user/queryapi/conf/config.hocon.sample'
end

execute 'make run script executable' do
  command 'chmod u+x /home/ec2-user/queryapi/bin/run_queryapi.sh'
end

execute 'stop app' do
  command 'service queryapi restart'
end

# execute 'start app' do
#   command 'service queryapi start'
# end