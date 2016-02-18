node.default['module']['name'] = "s3_exporter"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"

node.default['module']['cluster_id']="j-16ZTD99EVABOJ"
node.default['module']['queue_url'] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_s3exporter"



include_recipe 'eventstore::emr'


