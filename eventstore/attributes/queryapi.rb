node.default[:queryapi][:ci]={
	:variables =>{
		:field_mapper_url => "http://ec2-52-91-80-204.compute-1.amazonaws.com:9090/v1/mappings",
		:es_host => "ec2-54-210-82-225.compute-1.amazonaws.com",
		:es_port => 9300
	}
}

node.default[:queryapi] = node.default[:queryapi][node[:env]]
