define :nginx_api_proxy, enable: true, name: nil, domain: nil, include_file: nil, forwared_for: nil, source: 'proxied-api.conf.erb', cookbook: 'apiaxle' do
  template "#{node[:nginx][:dir]}/sites-available/#{params[:name]}" do
    source   params[:source]
    cookbook params[:cookbook]
    notifies :reload, 'service[nginx]'
    variables(
      domain:       params[:domain],
      api_name:     params[:name],
      include_file: params[:include_file]
    )
  end

  if params[:enable]
    nginx_site params[:name]
  else
    nginx_site params[:name] do
      enable false
    end
  end
end
