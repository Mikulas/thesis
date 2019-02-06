#
# Cookbook:: gocd
# Recipe:: default
#

package %w(curl ca-certificates openjdk-8-jdk rsync) do
  action :upgrade
end

apt_repository "gocd" do
  uri "https://download.gocd.org"
  distribution "/"
  key "https://download.gocd.org/GOCD-GPG-KEY.asc"
end

package 'go-server' do
  version '19.1.0'
  action :upgrade
end

package %w(docker.io) do
  action :upgrade
end

service "go-server" do
  action :start
end

package 'go-agent' do
  version '19.1.0'
  action :upgrade
end

service "go-agent" do
  action :start
end
