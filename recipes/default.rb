execute "apt-get update"

package 'build-essential'
package 'python-software-properties'
package 'libxml2-dev'

include_recipe "redisio"
include_recipe "redisio::enable"

include_recipe "nodejs"
include_recipe "nodejs::npm"

include_recipe 'runit::default'

nodejs_npm 'apiaxle-proxy'
nodejs_npm 'apiaxle-api'
nodejs_npm 'apiaxle-repl'

runit_service 'apiaxle-api' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
end

runit_service 'apiaxle-proxy' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
end

runit_service 'apiaxle-proxy-event-subscriber' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
end
