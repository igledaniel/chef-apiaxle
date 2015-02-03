#
# Cookbook Name:: apiaxle
# Recipe:: _setup
#

include_recipe 'apt::default'
include_recipe 'nodejs::default'
include_recipe 'runit::default'
include_recipe 'apiaxle::_user'

# for apiaxle npm modules
%w(build-essential python-software-properties libxml2-dev).each do |dep|
  package dep
end
