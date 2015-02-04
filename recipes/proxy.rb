#
# Cookbook Name:: apiaxle
# Recipe:: proxy
#

include_recipe 'apiaxle::_setup'
include_recipe 'apiaxle::_config'
include_recipe 'nginx::default'

template '/etc/nginx/sites-available/apiaxle-proxy' do
  source 'nginx-proxy.conf.erb'
end

nginx_site 'default' do
  enable false
end

nginx_site 'apiaxle-proxy' do
  enable true
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
