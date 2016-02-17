file '/home/ec2-user/message' do
  content node[:sample]
  mode '0755'
end

file '/home/ec2-user/message1' do
  content node[:sample1]
  mode '0755'
end