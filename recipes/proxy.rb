#
# Cookbook Name:: apiaxle
# Recipe:: proxy
#

include_recipe 'ohai'
include_recipe 'apiaxle::_setup'
include_recipe 'apiaxle::_config'
include_recipe 'nginx::default'
include_recipe 'git::default'

# override the default init script
template '/etc/init.d/nginx' do
  source  'nginx.erb'
  owner   'root'
  group   'root'
  mode    0755
end

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

execute 'generate resolver config' do
  command <<-EOH
    echo resolver $(awk 'BEGIN{ORS=" "} /nameserver/{print $2}' /etc/resolv.conf | sed "s/ $/;/g") >/etc/nginx/conf.d/resolver.conf
  EOH
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/blocked_ips.conf' do
  source 'blocked_ips.conf.erb'
  variables(
    blocked_ips: node[:apiaxle][:proxied][:blocked_ips],
    real_ip_from: node[:apiaxle][:proxied][:real_ip_from]
  )
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/apiaxle-proxy-upstream.conf' do
  source 'apiaxle-proxy-upstream.conf.erb'
  notifies :reload, 'service[nginx]'
end

nodejs_npm 'apiaxle-proxy' do
  options ['--unsafe-perm']
  version node[:apiaxle][:proxy][:version]
  url     node[:apiaxle][:proxy][:url]
  notifies :restart, 'runit_service[apiaxle-proxy]', :delayed
  notifies :restart, 'runit_service[apiaxle-proxy-event-subscriber]', :delayed
end

directory '/var/log/apiaxle-hit-processors' do
  owner 'apiaxle'
  group 'apiaxle'
  mode '0755'
  action :create
end

node[:apiaxle][:proxy_event_subscriber][:hit_processors].each do |processor|
  nodejs_npm processor.url do
    version processor.version
    url processor.url
    notifies :restart, 'runit_service[apiaxle-proxy-event-subscriber]', :delayed
  end
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
