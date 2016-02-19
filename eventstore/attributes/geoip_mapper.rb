node.default[:geoip_mapper][:variables]={}
node.default[:geoip_mapper] = node.default[:geoip_mapper][node[:env]]
