queue_url = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"
node.default[:enricher][:ci]={
	:cluster_id => "j-3A8CDL97FG94S",
	:queue_url => queue_url,
	:variables =>{
		:geoMapperUrl => "http://ec2-54-86-121-127.compute-1.amazonaws.com:8082/geoip/api/v1",
		:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
	    :raw_event_stream_name => "espoc-raw-events",
	    :bad_event_stream_name => "espoc-bad-events",
	    :enriched_event_stream_name => "espoc-enriched-events",
	    :sqsUrl => queue_url
	}
}

node.default[:enricher] = node.default[:enricher][node[:env]]
