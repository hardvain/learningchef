module_name = "bad_event_logger"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"
node.default['module']['executable_path'] = "/home/#{user}/#{module_name}/bin/run_#{module_name}.sh"

include_recipe 'eventstore::default'
