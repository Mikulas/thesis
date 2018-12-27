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

ENV["EXTERNAL_URL"] = "http://gitlab.ditemiku.local"
package %w(gitlab-ee) do
  action :upgrade
end
