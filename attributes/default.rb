default[:apiaxle][:environment]                            = 'development'
default[:apiaxle][:version]                                = '1.12.35'
default[:apiaxle][:proxy][:version]                        = node[:apiaxle][:version]
default[:apiaxle][:proxy][:url]                            = nil
default[:apiaxle][:api][:version]                          = node[:apiaxle][:version]
default[:apiaxle][:api][:url]                              = nil
default[:apiaxle][:repl][:version]                         = node[:apiaxle][:version]
default[:apiaxle][:repl][:url]                             = nil

# config
default[:apiaxle][:config][:cfgdir]                        = '/etc/apiaxle'
default[:apiaxle][:config][:log_level]                     = 'DEBUG'

# user
default[:apiaxle][:user][:create]                          = true
default[:apiaxle][:user][:home]                            = '/home/apiaxle'
default[:apiaxle][:user][:name]                            = 'apiaxle'
default[:apiaxle][:user][:group]                           = 'apiaxle'
default[:apiaxle][:user][:filehandle_limit]                = 10_240

# redis
default[:apiaxle][:redis][:host]                           = 'localhost'
default[:apiaxle][:redis][:port]                           = 6379

default[:redisio][:version]                                = '2.8.17'

# api
default[:apiaxle][:api][:host]                             = '0.0.0.0'
default[:apiaxle][:api][:port]                             = 3000
default[:apiaxle][:api][:process_forks]                    = node[:cpu][:total]

# proxy
default[:apiaxle][:proxy][:host]                           = '127.0.0.1'
default[:apiaxle][:proxy][:port]                           = 3100
default[:apiaxle][:proxy][:process_forks]                  = node[:cpu][:total]
default[:apiaxle][:proxy][:process_events]                 = true

default[:apiaxle][:proxy_event_subscriber][:process_forks] = node[:cpu][:total]
default[:apiaxle][:proxy_event_subscriber][:enable_builtin_stats] = true
default[:apiaxle][:proxy_event_subscriber][:hit_processors] = []
default[:apiaxle][:proxy_event_subscriber][:env]           = {}

# web_admin
default[:apiaxle][:web_admin][:repository]                 = 'https://github.com/mapzen/apiaxle-admin.git'
default[:apiaxle][:web_admin][:reversion]                  = 'master'
default[:apiaxle][:web_admin][:release_version]            = 'v1'
default[:apiaxle][:web_admin][:install_dir]                = '/usr/local/src/apiaxle-admin'
default[:apiaxle][:web_admin][:listen_port]                = 80
default[:apiaxle][:web_admin][:api_host]                   = 'localhost'
default[:apiaxle][:web_admin][:api_port]                   = node[:apiaxle][:api][:port]
default[:apiaxle][:web_admin][:allowed_ips]                = %w(
  127.0.0.1
  10.0.0.0/8
  172.16.0.0/12
  192.168.0.0/16
)

# nodejs
default[:nodejs][:install_method]                          = 'binary'
default[:nodejs][:version]                                 = '0.10.36'
default[:nodejs][:binary][:checksum][:linux_x64]           = '2bc13477684a9fe534bdc9d8f4a8caf6257a11953b57c42cad9b919ee259a0d5'
