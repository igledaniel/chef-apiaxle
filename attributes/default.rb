default[:apiaxle][:environment] = "production"
default[:apiaxle][:user] = 'vagrant'
default[:apiaxle][:group] = 'vagrant'

default[:apiaxle][:redis][:host] = "localhost"
default[:apiaxle][:redis][:port] = 6379
default[:apiaxle][:log_file] = "/var/log/apiaxle/#{node[:apiaxle][:environment]}.log"

default[:apiaxle][:api][:host] = '0.0.0.0'
default[:apiaxle][:api][:port] = 3000
default[:apiaxle][:api][:process_forks] = 4

default[:apiaxle][:proxy][:host] = '0.0.0.0'
default[:apiaxle][:proxy][:port] = 3100
default[:apiaxle][:proxy][:process_forks] = 1
default[:apiaxle][:proxy][:process_events] = true

default[:apiaxle][:proxy_event_subscriber][:process_forks] = 1

