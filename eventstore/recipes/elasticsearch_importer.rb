node.default['module']['name'] = "elasticsearch_importer"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"
node.default[:elasticsearch_importer][:variables]={
	:s3_in_bucket => "espoc-events",
	:s3_in_prefix => "elasticsearch/enriched",
	:s3_archive_bucket => "espoc-events",
	:s3_archive_prefix => "elasticsearch/archive",
	:es_host => "ec2-54-210-82-225.compute-1.amazonaws.com",
	:es_port => 9300
}

include_recipe 'eventstore::cron'


remote_file "#{node[:module][:path]}/conf/config.hocon" do
  source "file://#{node[:module][:path]}/conf/config.hocon.sample"
end

execute 'make run script executable' do
  user "root"
  command "chmod u+x #{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end


cron 'start cron' do
  hour '5'
  minute '0'
  command "#{node[:module][:path]}/bin/run_#{node[:module][:name]}.sh"
end
