module_name = "field_mapper"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"
node.default['module']['executable_path'] = "/home/#{user}/#{module_name}/bin/run_#{module_name}.sh"

include_recipe 'eventstore::service'
