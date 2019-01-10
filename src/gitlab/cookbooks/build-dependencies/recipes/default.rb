#
# Cookbook:: build-dependencies
# Recipe:: default
#

reboot 'now' do
  reason "RVM requires reboot"
  action :nothing
end

execute 'add_rvm_repo' do
  command 'apt-add-repository -y ppa:rael-gc/rvm'
end

package %w(build-essential software-properties-common rvm zlib1g-dev) do
  action :upgrade
  notifies :reboot_now, 'reboot[now]', :immediately
end

execute 'install_ruby' do
  command 'rvm install ruby-2.6'
end

group 'rvm' do
  action :modify
  members 'gitlab-runner'
  append true
end

execute 'install_ruby_for_user' do
  command 'rvm use ruby-2.6'
  user 'gitlab-runner'
end

execute 'install_jekyll_bundler' do
  command 'gem install jekyll bundler'
  user 'gitlab-runner'
end
