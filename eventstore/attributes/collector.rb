node.default[:collector][:variables]= {
	:aws_region => node.default[:aws_region],
	:bad_stream_name => "espoc-bad-events",
	:good_stream_name => "espoc-raw-events"
}