#
# Cookbook:: deps-p3-build
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
  members node["deps-p3-build"]['user']
  append true
end
