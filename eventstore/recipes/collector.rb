module_name = "collector"
node.default['user'] = "ec2-user"
node.default['module']['name'] = node.default['user']
node.default['module']['path'] = "/home/#{user}/#{module_name}"
node.default['module']['executable_path'] = "/home/#{user}/#{module_name}/bin/run_#{module_name}.sh"

include_recipe 'eventstore::service'
