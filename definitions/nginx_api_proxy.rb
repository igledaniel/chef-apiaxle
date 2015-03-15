define :nginx_api_proxy, name: nil, domain: nil, forwared_for: nil, enable: true do
  template "#{node[:nginx][:dir]}/sites-available/#{params[:name]}" do
    source 'proxied-api.conf.erb'
    notifies :reload, 'service[nginx]'
    variables api_name: params[:name], domain: params[:domain], forwarded_for: params[:forwarded_for]
  end
  if params[:enable]
    nginx_site params[:name]
  else
    nginx_site params[:name] do
      enable false
    end
  end
end
