#
# Cookbook Name:: apiaxle
# Recipe:: config
#

include_recipe 'apiaxle::user'

include_recipe 'apt::default'

%w(build-essential python-software-properties libxml2-dev).each do |dep|
  package dep
end

include_recipe 'nodejs::default'
include_recipe 'nodejs::npm'

include_recipe 'runit::default'

directory '/etc/apiaxle' do
  action  :create
  owner   node[:apiaxle][:user][:name]
  group   node[:apiaxle][:user][:group]
  mode    '0644'
end

file "/etc/apiaxle/#{node[:apiaxle][:environment]}.json" do
  action  :create
  owner   'root'
  group   'root'
  mode    '0644'
  content <<-EOM
{
  "redis": {
    "host": "#{node[:apiaxle][:redis][:host]}",
    "port": #{node[:apiaxle][:redis][:port]}
  },
  "application": {
    "debug": true
  },
  "logging": {
    "level": "DEBUG",
    "appenders": [{
      "type": "stdout"
    }]
  }
}
  EOM
end
