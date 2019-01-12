#
# Cookbook:: ssh-ring
# Recipe:: default
#

node['ssh-ring']['home-dirs'].each do |user, homeDir|
  user user do
    action :modify
    shell '/bin/bash'
  end
  directory homeDir+'/.ssh' do
    owner user
    group user
    mode '0744'
    action :create
  end
  cookbook_file homeDir+'/.ssh/id_rsa' do
    source 'id_rsa'
    owner user
    group user
    mode '0600'
    action :create
  end
  cookbook_file homeDir+'/.ssh/id_rsa.pub' do
    source 'id_rsa.pub'
    owner user
    group user
    mode '0600'
    action :create
  end
  cookbook_file homeDir+'/.ssh/authorized_keys' do
    source 'id_rsa.pub'
    owner user
    group user
    mode '0644'
    action :create
  end

end
