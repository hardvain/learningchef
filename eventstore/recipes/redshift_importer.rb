module_name = "redshift_importer"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"

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
