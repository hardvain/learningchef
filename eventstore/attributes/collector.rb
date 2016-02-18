node.default[:module][:variables]= {
	:aws_region => node.default[:aws_region],
	:bad_steam_name => "espoc-bad-events",
	:good_stream_name => "espoc-raw-events"
}