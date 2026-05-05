name              'yum-remi-chef'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs and configures the Remi\'s yum repository'
version           '9.0.0'
source_url        'https://github.com/sous-chefs/yum-remi-chef'
issues_url        'https://github.com/sous-chefs/yum-remi-chef/issues'
chef_version      '>= 16'

depends 'yum', '>= 7.3.0' # for `dnf_module`
depends 'yum-epel'

supports 'almalinux', '>= 8.0'
supports 'centos_stream', '>= 9.0'
supports 'oracle', '>= 8.0'
supports 'redhat', '>= 8.0'
supports 'rocky', '>= 8.0'
