node.default[:module][:name] = "enricher"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:module][:cluster_id]="j-3N1J6158WWIJX"
node.default[:module][:queue_url] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"
    
node.default[:enricher][:variables]={
	:geoMapperUrl => "http://ec2-54-86-121-127.compute-1.amazonaws.com:8082/geoip/api/v1",
	:kinesis_url => "https://kinesis.us-east-1.amazonaws.com",
    :raw_event_stream_name => "espoc-raw-events",
    :bad_event_stream_name => "espoc-bad-events",
    :enriched_event_stream_name => "espoc-enriched-events",
    :sqsUrl => node.default[:module][:queue_url]
}

include_recipe 'eventstore::emr'


