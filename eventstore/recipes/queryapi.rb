node.default['module']['name'] = "queryapi"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:queryapi][:variables]={
	:field_mapper_url => "http://ec2-52-91-80-204.compute-1.amazonaws.com:9090/v1/mappings",
	:es_host => "ec2-54-210-82-225.compute-1.amazonaws.com",
	:es_port => 9300
}

include_recipe 'eventstore::service'
