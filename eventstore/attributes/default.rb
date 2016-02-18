node.default['user'] = "ec2-user"
node.default['module']['path'] = "/home/#{node.default[:user]}/#{node.normal[:module][:name]}"
node.default['module']['executable_path'] = "/home/#{node.default[:user]}/#{node.normal[:module][:name]}/bin/run_#{node.normal[:module][:name]}.sh"
node.default[:aws_region]="us-east-1"