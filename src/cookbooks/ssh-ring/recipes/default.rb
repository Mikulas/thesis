#
# Cookbook:: ssh-ring
# Recipe:: default
#

node['ssh-ring']['home-dirs'].each do |user, homeDir|
  directory homeDir+'/.ssh' do
    owner 'www-data'
    group 'www-data'
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
