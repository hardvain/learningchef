#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file 'queryapi.zip' do
  source 'queryapi-0.2.0.zip'
  mode '0644'
end

cookbook_file '/etc/init.d/queryapi' do
  source 'queryapi'
  mode '0755'
end

# directory '/home/vagrant/queryapi' do
#   mode '0644'
# end
package 'unzip'

directory 'queryapi' do
  mode '0644'
  recursive true
  action :delete
  not_if { !::File.directory?(::File.join('.', 'queryapi')) }
end


execute 'unzip' do
  command 'unzip -o ./queryapi.zip -d ./queryapi'
end

remote_file "./queryapi/conf/config.hocon" do
  source 'file://queryapi/conf/config.hocon.sample'
end

execute 'make run script executable' do
  command 'chmod u+x ./queryapi/bin/run_queryapi.sh'
end

execute 'stop app' do
  command 'service queryapi restart'
end

# execute 'start app' do
#   command 'service queryapi start'
# end