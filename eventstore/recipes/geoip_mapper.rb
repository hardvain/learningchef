node.default['module']['name'] = "geoip_mapper"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:geoip_mapper][:variables]={}

include_recipe 'eventstore::service'
