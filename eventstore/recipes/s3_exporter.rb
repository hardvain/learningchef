module_name = "s3_exporter"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"

include_recipe 'eventstore::emr'


