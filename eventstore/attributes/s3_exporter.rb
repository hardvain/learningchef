
node.default['module']['cluster_id']="j-16ZTD99EVABOJ"
node.default['module']['queue_url'] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_s3exporter"

node.default[:s3_exporter][:variables]={
	:field_mapper_url => "http://ec2-52-91-80-204.compute-1.amazonaws.com:9090/v1/ff",
	:aws_region => node.default[:aws_region],
	:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
	:enriched_events_stream => "espoc-enriched-events",
	:bad_events_stream => "espoc-bad-events",
	:redshift_good_stream => "espoc-events",
	:redshift_good_path_prefix => "redshift/enriched",
	:redshift_bad_stream => "espoc-events",
	:redshift_bad_path_prefix => "redshift/enriched-bad",
	:es_good_stream => "espoc-events",
	:es_good_path_prefix => "elasticsearch/enriched",
	:es_bad_stream => "espoc-events",
	:es_bad_path_prefix => "elasticsearch/enriched-bad",
	:sqs_url => node.default['module']['queue_url'] 
}