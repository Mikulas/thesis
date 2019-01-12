#
# Cookbook:: deps-p2-build
# Recipe:: default
#

package %w(php7.2 php7.2-xml composer unzip) do
  action :upgrade
end
