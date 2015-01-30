#
# Cookbook Name:: apiaxle
# Recipe:: api
#

include_recipe 'apiaxle::user'

include_recipe 'runit::default'

nodejs_npm 'apiaxle-api'

runit_service 'apiaxle-api' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
end
