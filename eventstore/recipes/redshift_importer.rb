node.default['module']['name'] = "redshift_importer"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"

include_recipe 'eventstore::cron'

execute 'make run script executable' do
  user "root"
  command "chmod u+x #{node[:module][:path]}/bin/data_load.sh"
end

cron 'start cron' do
  hour '0'
  minute '5'
  command "#{node[:module][:path]}/bin/data_load.sh"
end
