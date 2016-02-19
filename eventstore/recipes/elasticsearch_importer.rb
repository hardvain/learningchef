node.default['module']['name'] = "elasticsearch_importer"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"

include_recipe 'eventstore::service'
