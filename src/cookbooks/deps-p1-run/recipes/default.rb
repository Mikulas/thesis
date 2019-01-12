#
# Cookbook:: deps-p1-run
# Recipe:: default
#

directory '/srv/p1' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end
