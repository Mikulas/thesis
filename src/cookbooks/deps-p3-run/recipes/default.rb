#
# Cookbook:: deps-p3-run
# Recipe:: default
#

package %w(docker.io) do
  action :upgrade
end

cookbook_file '/etc/docker/daemon.json' do
  source 'daemon.json'
  mode '0644'
  action :create
end

service 'docker' do
  action :restart
end

group 'docker' do
  action :modify
  members 'www-data'
  append true
end

directory '/srv/p3' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end

directory '/var/www/.docker' do
  owner 'www-data'
  group 'www-data'
  mode '0770'
  action :create
end
