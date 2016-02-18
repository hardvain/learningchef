node.default[:module][:name] = "enricher"
node.default[:module][:cluster_id]="j-3N1J6158WWIJX"
node.default[:module][:queue_url]="https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"

node.default[:module][:variables]={
	:geoMapperUrl => "http://ec2-54-86-121-127.compute-1.amazonaws.com:8082/geoip/api/v1",
	:kinesis => {
		:endPointUrl => "https://kinesis.us-east-1.amazonaws.com",
		:in  => {
            :raw => "espoc-raw-events"
        }
        :out  => {
            :enriched => "espoc-enriched-events"
            :bad => "espoc-bad-events"
        },
        :sqsUrl => "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"
	}
}
