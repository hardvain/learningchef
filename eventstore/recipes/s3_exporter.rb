module_name = "s3_exporter"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"
node.default['module']['cluster_id']="j-16ZTD99EVABOJ"
node.default['module']['queue_url'] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_s3exporter"
include_recipe 'eventstore::emr'


