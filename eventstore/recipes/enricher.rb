node.default[:module][:name] = "enricher"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:module][:cluster_id]="j-3N1J6158WWIJX"
node.default[:module][:queue_url] = "https://sqs.us-east-1.amazonaws.com/046872521175/espoc_shutdown_enricher"
    

include_recipe 'eventstore::emr'


