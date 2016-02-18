node.default['module']['name'] = "elasticsearch_importer"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"

include_recipe 'eventstore::cron'


remote_file "#{node[:module][:path]}/conf/config.hocon" do
  source "file://#{node[:module][:path]}/conf/config.hocon.sample"
end

execute 'make run script executable' do
  user "root"
  command "chmod u+x #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end


cron 'start cron' do
  hour '5'
  minute '0'
  command "#{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end
