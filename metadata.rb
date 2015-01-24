name 'yum-remi'
maintainer 'Chef'
maintainer_email 'Sean OMeara <sean@chef.io>'
license 'Apache 2.0'
description 'Installs/Configures yum-remi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'yum-epel'
