name 'yum-remi-chef'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description "Installs and configures the Remi's yum repository"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.2.0'

depends 'compat_resource', '>= 12.14.6'
depends 'yum-epel'

%w(amazon centos fedora oracle redhat scientific).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/yum-remi-chef'
issues_url 'https://github.com/chef-cookbooks/yum-remi-chef/issues'

chef_version '>= 12.1'
