#
# Cookbook:: hosts
# Recipe:: default
#

cookbook_file '/etc/hosts' do
  source 'hosts'
  action :create
end
