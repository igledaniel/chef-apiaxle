#
# Cookbook Name:: apiaxle
# Recipe:: api
#

include_recipe 'apiaxle::_setup'
include_recipe 'apiaxle::_config'

nodejs_npm 'apiaxle-api' do
  version node[:apiaxle][:api][:version]
  url     node[:apiaxle][:api][:url]
  notifies :restart, 'runit_service[apiaxle-api]', :delayed
end

nodejs_npm 'apiaxle-repl' do
  version node[:apiaxle][:repl][:version]
  url     node[:apiaxle][:repl][:url]
end

runit_service 'apiaxle-api' do
  action          [:enable]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, "template[#{node[:apiaxle][:config][:cfgdir]}/#{node[:apiaxle][:environment]}.json]", :delayed
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end
