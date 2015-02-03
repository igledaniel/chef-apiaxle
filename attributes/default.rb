default[:apiaxle][:environment]                            = 'development'
default[:apiaxle][:version]                                = '1.12.34'

# config
default[:apiaxle][:config][:cfgdir]                        = '/etc/apiaxle'
default[:apiaxle][:config][:log_level]                     = 'DEBUG'

# user
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
default[:apiaxle][:proxy][:host]                           = '0.0.0.0'
default[:apiaxle][:proxy][:port]                           = 3100
default[:apiaxle][:proxy][:process_forks]                  = node[:cpu][:total]
default[:apiaxle][:proxy][:process_events]                 = true

default[:apiaxle][:proxy_event_subscriber][:process_forks] = node[:cpu][:total]

# web_admin
default[:apiaxle][:web_admin][:repository]                 = 'https://github.com/mapzen/apiaxle-admin.git'
default[:apiaxle][:web_admin][:reversion]                  = 'master'
default[:apiaxle][:web_admin][:install_dir]                = '/usr/local/src/apiaxle-admin'

# nodejs
default[:nodejs][:install_method]                          = 'binary'
default[:nodejs][:version]                                 = '0.10.32'
default[:nodejs][:checksum_linux_x64]                      = '621777798ed9523a4ad1c4d934f94b7bc765871d769a014a53a4f1f7bcb5d5a7'
