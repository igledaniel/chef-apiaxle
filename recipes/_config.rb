#
# Cookbook Name:: apiaxle
# Recipe:: _config
#

include_recipe 'apiaxle::_user'

directory node[:apiaxle][:config][:cfgdir] do
  action    :create
  recursive true
  owner     node[:apiaxle][:user][:name]
  group     node[:apiaxle][:user][:group]
  mode      '0755'
end

template "#{node[:apiaxle][:config][:cfgdir]}/#{node[:apiaxle][:environment]}.json" do
  action  :create
  owner   node[:apiaxle][:user][:name]
  group   node[:apiaxle][:user][:group]
  mode    '0644'
  source  'apiaxle.json.erb'
  variables(
    redis_host: node[:apiaxle][:redis][:host],
    redis_port: node[:apiaxle][:redis][:port],
    log_level: node[:apiaxle][:config][:log_level]
  )
end
