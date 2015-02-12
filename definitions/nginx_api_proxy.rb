define :nginx_api_proxy, name: nil, domain: nil, enable: true do
  template "#{node[:nginx][:dir]}/sites-available/#{params[:name]}" do
    source 'proxied-api.conf.erb'
    notifies :reload, "service[nginx]"
    variables api_name: params[:name],
	      domain: params[:domain]
  end
  if params[:enable]
    nginx_site params[:name]
  else
    nginx_site params[:name] do
      enable false
    end
  end
end
