node.default['module']['name'] = "redshift_importer"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.default[:module][:name]}/bin/run_#{node.default[:module][:name]}.sh"

package 'unzip'

directory "#{node[:module][:path]}" do
  mode '0644'
  recursive true
  action :delete
  not_if { !::File.directory?(::File.join(node[:module][:path], node[:module][:name])) }
end

directory "#{node[:module][:path]}" do
  mode '0644'
end

remote_file "#{node[:module][:path]}.zip" do
  source "https://s3.amazonaws.com/espoc-apps/#{node[:module][:name]}.zip"
  action :create
  mode '0644'
end

execute 'unzip' do
  command "unzip -o #{node[:module][:path]}.zip -d #{node[:module][:path]}"
end

execute 'Make module path accessible' do
  command "chmod 757 -R #{node[:module][:path]}"
end


execute 'make run script executable' do
  user "root"
  command "chmod u+x #{node[:module][:path]}/bin/data_load.sh"
end

cron 'start cron' do
  hour '0'
  minute '5'
  command "#{node[:module][:path]}/bin/data_load.sh"
end
