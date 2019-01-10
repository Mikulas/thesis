#
# Cookbook:: gitlab-runner
# Recipe:: default
#

package %w(curl openssh-server ca-certificates postfix) do
  action :upgrade
end

remote_file '/opt/gitlab-add-runner-repo.sh' do
  source 'https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh'
  mode '0777'
  action :create
end

execute 'add_gitlab_runner_repo' do
  command '/opt/gitlab-add-runner-repo.sh'
end

package 'gitlab-runner' do
  version '11.6.0'
  action :upgrade
end

http_request 'wait_for_gitlab_to_start' do
  url 'http://localhost/'
  retry_delay 6 # seconds
  retries 10 # wait up to 1 minute
end

execute 'add_gitlab_runner_repo' do
  command '
gitlab-runner register \
  --non-interactive \
  --url "http://localhost/" \
  --clone-url "http://localhost/" \
  --registration-token "preset-runner-token" \
  --executor "shell" \
  --description "custom-runner" \
  --run-untagged \
  --locked="false"
'
end
