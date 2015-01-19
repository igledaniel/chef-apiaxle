file "/etc/profile.d/node_environment.sh" do
  owner 'root'
  group 'root'
  mode '0644'
  content "export NODE_ENV=#{node[:apiaxle][:environment]}"
  action :create
end
