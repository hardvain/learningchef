node.normal['module']['name'] = "elasticsearch_importer"
node.default[:module][:cluster_id] = ""
node.default[:module][:variables]={
	:s3 => {
		:in => {
			 :bucket => "espoc-events",
             :prefix => "elasticsearch/enriched"
		},
		:archive => {
            :bucket => "espoc-events",
            :prefix => "elasticsearch/archive"
        }
	},
	:elasticsearch => {
		:hostName => "ec2-54-210-82-225.compute-1.amazonaws.com",
        :port => 9300
	}
}
