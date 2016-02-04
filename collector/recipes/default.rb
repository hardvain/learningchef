#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe "java"

cookbook_file '/home/vagrant/collector.zip' do
  source 'collector-0.2.0.zip'
  mode '0644'
end

cookbook_file '/etc/init.d/collector' do
  source 'collector'
  mode '0755'
end

# directory '/home/vagrant/collector' do
#   mode '0644'
# end
package 'unzip'

directory '/home/vagrant/collector' do
  mode '0644'
  recursive true
  action :delete
  not_if { !::File.directory?(::File.join('/home/vagrant', 'collector')) }
end


execute 'unzip' do
  command 'unzip -o /home/vagrant/collector.zip -d /home/vagrant/collector'
end

remote_file "/home/vagrant/collector/conf/config.hocon" do
  source 'file:///home/vagrant/collector/conf/config.hocon.sample'
end

execute 'make run script executable' do
  command 'chmod u+x /home/vagrant/collector/bin/run_collector.sh'
end

execute 'start app' do
  command 'sh /etc/init.d/collector restart'
end