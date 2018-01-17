default['yum']['remi-php72']['repositoryid'] = 'remi-php72'
default['yum']['remi-php72']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php72']['gpgcheck'] = true
default['yum']['remi-php72']['enabled'] = true
default['yum']['remi-php72']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi-php72']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php72/$basearch/"
  default['yum']['remi-php72']['mirrorlist'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php72/mirror"
  default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi-php72']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php72/$basearch/'
  default['yum']['remi-php72']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php72/mirror'
  default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['remi-php72']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php72/$basearch/"
  default['yum']['remi-php72']['mirrorlist'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php72/mirror"
  default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
