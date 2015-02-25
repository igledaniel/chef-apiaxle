#
# Cookbook Name:: apiaxle
# Recipe:: proxy
#

include_recipe 'ohai'
include_recipe 'apiaxle::_setup'
include_recipe 'apiaxle::_config'
include_recipe 'nginx::default'

directory '/var/www/nginx-default' do
  user node[:nginx][:user]
  group node[:nginx][:user]
  recursive true
end

file '/var/www/nginx-default/index.html' do
  user node[:nginx][:user]
  group node[:nginx][:user]
  content '<h1>WORKS!</h1>'
end

template '/etc/nginx/conf.d/apiaxle-proxy-upstream.conf' do
  source 'apiaxle-proxy-upstream.conf.erb'
  notifies :reload, 'service[nginx]'
end

nodejs_npm 'apiaxle-proxy' do
  version node[:apiaxle][:version]
end

runit_service 'apiaxle-proxy' do
  action          [:enable]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, "template[#{node[:apiaxle][:config][:cfgdir]}/#{node[:apiaxle][:environment]}.json]", :delayed
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end

runit_service 'apiaxle-proxy-event-subscriber' do
  action          [:enable]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, "template[#{node[:apiaxle][:config][:cfgdir]}/#{node[:apiaxle][:environment]}.json]", :delayed
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end
