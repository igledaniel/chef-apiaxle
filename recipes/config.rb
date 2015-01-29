execute "apt-get update"

package 'build-essential'
package 'python-software-properties'
package 'libxml2-dev'

include_recipe "nodejs"
include_recipe "nodejs::npm"

include_recipe 'runit::default'


include_recipe "apiaxle::environment"
directory "/var/log/apiaxle" do
  owner node[:apiaxle][:user]
  group node[:apiaxle][:user]
end

directory "/etc/apiaxle" do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

file "/etc/apiaxle/#{node[:apiaxle][:environment]}.json" do
  owner 'root'
  group 'root'
  mode '0644'
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
      "type": "file",
      "filename": "#{node[:apiaxle][:log_file]}"
    }]
  }
}
EOM
  action :create
end


