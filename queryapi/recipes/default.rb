#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'java_se'

remote_file '/home/ec2-user/queryapi.zip' do
  source 'https://s3.amazonaws.com/espoc-apps/queryapi-0.2.0.zip'
  action :create
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
  command "$(pgrep -f queryapi)"
end

execute 'start app' do
  command '/bin/bash queryapi/bin/run_queryapi.sh > /dev/null 2>&1 &'
end
