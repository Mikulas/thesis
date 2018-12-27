#
# Cookbook:: gitlab-omnibus
# Recipe:: default
#

package %w(curl openssh-server ca-certificates postfix) do
  action :upgrade
end

remote_file '/opt/gitlab-add-repo.sh' do
  source 'https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh'
  mode '0777'
  action :create
end

execute 'add_gitlab_repo' do
  command '/opt/gitlab-add-repo.sh'
end

package 'gitlab-ee' do
  version '11.6.0'
  action :upgrade
end

file '/etc/gitlab/gitlab.rb' do
  content node['gitlab.rb']
end

execute 'gitlab_ctl_reconfigure' do
  command 'gitlab-ctl reconfigure'
end

execute 'gitlab_ctl_restart' do
  command 'gitlab-ctl restart'
end
