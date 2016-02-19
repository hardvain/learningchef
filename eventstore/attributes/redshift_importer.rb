node.default[:redhsift_importer][:ci]={
	:cron_path => "bin/data_load.sh"
}

node.default[:redhsift_importer] = node.default[:redhsift_importer][node[:env]]
