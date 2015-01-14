execute "apt-get update"

package 'build-essential'
package 'python-software-properties'
package 'libxml2-dev'

include_recipe "apiaxle::install_redis"

include_recipe "nodejs"
include_recipe "nodejs::npm"

include_recipe 'runit::default'

include_recipe 'apiaxle::api'
include_recipe 'apiaxle::proxy'

nodejs_npm 'apiaxle-repl'

