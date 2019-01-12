#
# Cookbook:: deps-p2-run
# Recipe:: default
#

package %w(php7.2 php7.2-xml) do
  action :upgrade
end

directory '/srv/p2' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end
