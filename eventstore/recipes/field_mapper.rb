node.default['module']['name'] = "field_mapper"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:field_mapper][:variables]={
	:table_name => "FieldMapper"
}
include_recipe 'eventstore::service'
