#
# Cookbook Name:: apiaxle
# Recipe:: config
#

include_recipe 'apiaxle::setup'

directory node[:apiaxle][:setup][:cfgdir] do
  action    :create
  recursive true
  owner     node[:apiaxle][:user][:name]
  group     node[:apiaxle][:user][:group]
  mode      '0644'
end

template "#{node[:apiaxle][:setup][:cfgdir]}/#{node[:apiaxle][:environment]}.json" do
  action  :create
  owner   node[:apiaxle][:user][:name]
  group   node[:apiaxle][:user][:group]
  mode    '0644'
  source  'apiaxle.json.erb'
  variables({
    redis_host: node[:apiaxle][:redis][:host],
    redis_port: node[:apiaxle][:redis][:port]
  })
end
