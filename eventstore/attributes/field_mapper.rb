node.default[:field_mapper][:ci]={
	:variables => {
		:table_name => "FieldMapper"
	}
}
node.default[:field_mapper] = node.default[:field_mapper][node[:env]]
