module_name = "enricher"
user = "ec2-user"
node.default['module']['name'] = module_name
node.default['module']['path'] = "/home/#{user}/#{module_name}"
node.default['module']['cluster_id']="j-3N1J6158WWIJX"
node.default['module']['queue_url']="https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"
include_recipe 'eventstore::emr'


