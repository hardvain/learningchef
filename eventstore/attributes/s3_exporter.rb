node.default['module']['cluster_id']="j-16ZTD99EVABOJ"
node.default['module']['queue_url'] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_s3exporter"
node.default[:s3_exporter][:variables]={
	:field_mapper_url => "http://ec2-52-91-80-204.compute-1.amazonaws.com:9090/v1/ff",
	:aws_region => node.default[:aws_region],
	:in => {
		:kinesis => {
			:end_point_url => "https://kinesis.us-east-1.amazonaws.com",
			:stream => "espoc-enriched-events"
		}
	},
	:out => {
		:kinesis => {
			:bad => "espoc-bad-events"
		},
		:s3 => {
			:redshift => {
				:good => "espoc-events",
				:good_path_prefix => "redshift/enriched",
				:bad => "espoc-events",
				:bad_path_prefix => "redshift/enriched-bad"
			},
			:elasticsearch => {
				:good => "espoc-events",
				:good_path_prefix => "elasticsearch/enriched",
				:bad => "espoc-events",
				:bad_path_prefix => "elasticsearch/enriched-bad"
			}
		}
	},
	:sqs_url => node.default['module']['queue_url'] 
}
