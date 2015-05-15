node[:apiaxle][:proxied][:apis].each_pair do |api, host|
  nginx_api_proxy api do
    domain host
  end
end
