node.default[:bad_event_logger][:ci] = {
	:variables => {
		:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
		:bad_steam_name => "espoc-bad-events"
	}
}

node.default[:bad_event_logger] = node.default[:bad_event_logger][node[:env]]