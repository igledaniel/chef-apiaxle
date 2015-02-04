<<<<<<< Updated upstream
#
# Cookbook Name:: apiaxle
# Recipe:: web_admin
#

include_recipe 'git::default'

include_recipe 'git'
include_recipe 'nginx'

file '/etc/nginx/sites-enabled/default' do
  action :delete
end

service 'nginx' do
  action [:enable]
end

git node[:apiaxle][:web_admin][:install_dir] do
  action      :sync
  repository  node[:apiaxle][:web_admin][:repository]
  reference   node[:apiaxle][:web_admin][:revision]
  notifies    :restart, 'service[nginx]', :delayed
end

template '/etc/nginx/sites-available/apiaxle-admin' do
  source    'apiaxle-admin.conf.erb'
  notifies  :restart, 'service[nginx]', :delayed
  variables(
    install_dir: node[:apiaxle][:web_admin][:install_dir],
    listen_port: node[:apiaxle][:web_admin][:listen_port],
    allowed_ips: node[:apiaxle][:web_admin][:allowed_ips],
    release_version: node[:apiaxle][:web_admin][:release_version],
    api_host: node[:apiaxle][:web_admin][:api_host],
    api_port: node[:apiaxle][:web_admin][:api_port]
  )
end

nginx_site 'default' do
  enable false
end

nginx_site 'admin' do
  enable true
end
