node.default['module']['name'] = "bad_event_logger"
node.default[:module][:variables]= {
	:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
	:bad_steam_name => "espoc-bad-events"
}