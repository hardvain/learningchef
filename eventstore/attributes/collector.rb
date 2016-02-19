node.default[:collector][:ci] = {
	:variables => {
		:aws_region => node.default[:aws_region],
		:bad_stream_name => "espoc-bad-events",
		:good_stream_name => "espoc-raw-events"
	}
}

node.default[:collector] = node.default[:collector][node[:env]]
