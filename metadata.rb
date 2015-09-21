name 'yum-remi-chef'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description "Installs and configures the Remi's yum repository"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

depends 'yum', '~> 3.2'
depends 'yum-epel'

%w(amazon centos fedora oracle redhat scientific).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/yum-remi' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/yum-remi/issues' if respond_to?(:issues_url)
