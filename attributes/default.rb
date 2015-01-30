default[:apiaxle][:environment]                            = 'development'

default[:apiaxle][:setup][:cfgdir]                         = '/etc/apiaxle'

default[:apiaxle][:user][:home]                            = '/home/apiaxle'
default[:apiaxle][:user][:name]                            = 'apiaxle'
default[:apiaxle][:user][:group]                           = 'apiaxle'
default[:apiaxle][:user][:filehandle_limit]                = 10_240

default[:apiaxle][:redis][:host]                           = 'localhost'
default[:apiaxle][:redis][:port]                           = 6379

default[:apiaxle][:api][:host]                             = '0.0.0.0'
default[:apiaxle][:api][:port]                             = 3000
default[:apiaxle][:api][:process_forks]                    = node[:cpu][:total]

default[:apiaxle][:proxy][:host]                           = '0.0.0.0'
default[:apiaxle][:proxy][:port]                           = 3100
default[:apiaxle][:proxy][:process_forks]                  = node[:cpu][:total]
default[:apiaxle][:proxy][:process_events]                 = true

default[:apiaxle][:proxy_event_subscriber][:process_forks] = 1
