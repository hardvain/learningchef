node.default[:elasticsearch_importer][:ci] = {
	:variables => {
		:s3_in_bucket => "espoc-events",
		:s3_in_prefix => "elasticsearch/enriched",
		:s3_archive_bucket => "espoc-events",
		:s3_archive_prefix => "elasticsearch/archive",
		:es_host => "ec2-54-210-82-225.compute-1.amazonaws.com",
		:es_port => 9300
	}
}
node.default[:elasticsearch_importer] = node.default[:bad_event_logger][node[:env]]
