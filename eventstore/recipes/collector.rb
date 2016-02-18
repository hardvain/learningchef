node.default['module']['name'] = "collector"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:collector][:variables]= {
	:aws_region => node.default[:aws_region],
	:bad_stream_name => "espoc-bad-events",
	:good_stream_name => "espoc-raw-events"
}
include_recipe 'eventstore::service'
