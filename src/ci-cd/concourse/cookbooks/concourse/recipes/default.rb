#
# Cookbook:: concourse
# Recipe:: default
#

package %w(curl openssh-server ca-certificates postfix) do
  action :upgrade
end

remote_file '/usr/local/bin/concourse' do
  source 'https://github.com/concourse/concourse/releases/download/v4.2.2/concourse_linux_amd64'
  mode '0777'
  action :create
end

remote_file '/usr/local/bin/fly' do
  source 'https://github.com/concourse/concourse/releases/download/v4.2.2/fly_linux_amd64'
  mode '0777'
  action :create
end

user 'concourse' do
  comment 'concourse'
  home '/home/concourse'
  shell '/bin/bash'
  manage_home true
end

package %w(postgresql postgresql-contrib) do
  action :upgrade
end

service "postgresql" do
  action :start
end

# mkdir /opt/concourse
# chown

# CREATE USER concourse;
# ALTER USER concourse WITH PASSWORD 'concourse';
# ALTER USER concourse WITH SUPERUSER;
# CREATE DATABASE atc;
# ALTER DATABASE atc OWNER TO concourse;

# concourse quickstart \
#   --add-local-user mikulas:mikulas \
#   --main-team-local-user mikulas \
#   --external-url "http://concourse.ditemiku.local:8082" \
#   --worker-work-dir /opt/concourse/worker \
#   --postgres-database="atc" \
#   --postgres-user="concourse" \
#   --postgres-password="concourse" \
#   --bind-port=80

# fly -t example set-pipeline -c concourse.yml -p p1
