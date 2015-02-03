package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

include_recipe 'git'

git "/usr/local/src/apiaxle-admin" do
  repository "https://github.com/mapzen/apiaxle-admin.git"
  reference "master"
  action :sync
end

template "/etc/nginx/sites-available/admin" do
  source "apiaxle-admin.conf.erb"
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

link "/etc/nginx/sites-enabled/admin" do
  to "/etc/nginx/sites-available/admin"
end

service 'nginx' do
  action [ :restart ]
end

