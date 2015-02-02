#
# Cookbook Name:: apiaxle
# Recipe:: default
#

%w(
  config
  redis
  api
  proxy
).each do |recipe|
  include_recipe "apiaxle::#{recipe}"
end
