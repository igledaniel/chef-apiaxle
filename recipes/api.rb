#
# Cookbook Name:: apiaxle
# Recipe:: api
#

include_recipe 'apiaxle::_setup'
include_recipe 'apiaxle::_config'

%w(repl api).each do |p|
  nodejs_npm "apiaxle-#{p}" do
    version node[:apiaxle][p][:version]
    url     node[:apiaxle][p][:url]
  end
end

runit_service 'apiaxle-api' do
  action          [:enable]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, "template[#{node[:apiaxle][:config][:cfgdir]}/#{node[:apiaxle][:environment]}.json]", :delayed
  env('NODE_ENV' => "#{node[:apiaxle][:environment]}")
end
