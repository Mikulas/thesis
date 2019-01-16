#
# Cookbook:: nginx
# Recipe:: default
#

directory '/srv' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end

package %w(nginx) do
  action :upgrade
end

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx.conf'
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

cookbook_file '/etc/nginx/fastcgi_params' do
  source 'fastcgi_params'
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

file '/etc/nginx/sites-available/default' do
  action :delete
end

service 'nginx' do
  action :reload
end
