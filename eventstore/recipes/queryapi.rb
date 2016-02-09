node.default['module']['name'] = 'queryapi'
node.default['module']['path'] = '/home/ec2-user/queryapi'
node.default['module']['executable_path'] = '/home/ec2-user/queryapi/bin/run_queryapi.sh'

include_recipe 'eventstore::default'
