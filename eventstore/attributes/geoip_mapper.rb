node.default[:geoip_mapper][:ci]={:variables => {}}
node.default[:geoip_mapper] = node.default[:geoip_mapper][node[:env]]
