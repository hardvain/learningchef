node.default['module']['name'] = "redshift_importer"

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
