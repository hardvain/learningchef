node.default['module']['name'] = "bad_event_logger"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:bad_event_logger][:variables]= {
	:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
	:bad_steam_name => "espoc-bad-events"
}

include_recipe 'eventstore::service'
