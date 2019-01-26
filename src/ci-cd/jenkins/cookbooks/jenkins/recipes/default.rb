#
# Cookbook:: jenkins
# Recipe:: default
#

package %w(curl ca-certificates openjdk-8-jdk rsync) do
  action :upgrade
end

apt_repository "jenkins" do
  uri "http://pkg.jenkins.io/debian-stable"
  distribution "binary/"
  key "https://pkg.jenkins.io/debian/jenkins.io.key"
end

package 'jenkins' do
  version '2.150.2'
  action :upgrade
end

package %w(docker.io) do
  action :upgrade
end

group 'docker' do
  action :modify
  members 'jenkins'
  append true
end
