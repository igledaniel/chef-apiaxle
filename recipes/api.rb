#
# Cookbook Name:: apiaxle
# Recipe:: api
#

include_recipe 'apiaxle::setup'
include_recipe 'apiaxle::config'

nodejs_npm 'apiaxle-api'

runit_service 'apiaxle-api' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, 'template[]', :delayed
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end
