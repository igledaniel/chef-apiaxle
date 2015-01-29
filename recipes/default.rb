include_recipe "apiaxle::config"

include_recipe "apiaxle::install_redis"

include_recipe 'apiaxle::api'
include_recipe 'apiaxle::proxy'

nodejs_npm 'apiaxle-repl'

