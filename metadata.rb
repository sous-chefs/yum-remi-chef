name              'yum-remi-chef'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs and configures the Remi\'s yum repository'
version           '7.0.6'
source_url        'https://github.com/sous-chefs/yum-remi-chef'
issues_url        'https://github.com/sous-chefs/yum-remi-chef/issues'
chef_version      '>= 16'

depends 'yum', '>= 7.3.0'  # for `dnf_module`
depends 'yum-epel'

supports 'centos'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
