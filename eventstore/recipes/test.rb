template "/home/ec2-user/test" do
  source 'conf.erb'
  mode '0755'
  variables({
     :test => 123
  })
end