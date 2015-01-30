#
# Cookbook Name:: apiaxle
# Recipe:: default
#

include_recipe 'apiaxle::user'

include_recipe 'runit::default'

nodejs_npm 'apiaxle-proxy'

runit_service 'apiaxle-proxy' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end

runit_service 'apiaxle-proxy-event-subscriber' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end
