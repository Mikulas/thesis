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
  members 'gitlab-runner'
  append true
end

execute 'swarm_init' do
  command 'docker swarm init --advertise-addr 10.0.0.50'
end
