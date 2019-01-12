#
# Cookbook:: deps-p2-run
# Recipe:: default
#

package %w(php7.2 php7.2-fpm php7.2-xml php7.2-redis php7.2-mysql redis-server mariadb-server) do
  action :upgrade
end

directory '/srv/p2' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end

service 'php7.2-fpm' do
  action :start
end

service 'redis-server' do
  action :start
end

sudo 'www-data-reload-fpm' do
  users 'www-data'
  nopasswd true
end
