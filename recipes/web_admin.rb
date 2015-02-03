#
# Cookbook Name:: apiaxle
# Recipe:: web_admin
#

include_recipe 'git::default'

package 'nginx'

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
    install_dir: node[:apiaxle][:web_admin][:install_dir]
  )
end

link '/etc/nginx/sites-enabled/apiaxle-admin' do
  to '/etc/nginx/sites-available/apiaxle-admin'
end
