node.default[:enricher][:variables]={
	:geoMapperUrl => "http://ec2-54-86-121-127.compute-1.amazonaws.com:8082/geoip/api/v1",
	:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
    :raw_event_stream_name => "espoc-raw-events",
    :bad_event_stream_name => "espoc-bad-events",
    :enriched_event_stream_name => "espoc-enriched-events",
    :sqsUrl => node.default[:module][:queue_url]
}
