node[:apiaxle][:proxied][:apis].each do |api|
  nginx_api_proxy api
end
