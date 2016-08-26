default['yum']['remi-php56']['repositoryid'] = 'remi-php56'
default['yum']['remi-php56']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php56']['gpgcheck'] = true
default['yum']['remi-php56']['enabled'] = true
default['yum']['remi-php56']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi-php56']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php56/$basearch/"
  default['yum']['remi-php56']['mirrorlist'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php56/mirror"
  default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi-php56']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php56/$basearch/'
  default['yum']['remi-php56']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php56/mirror'
  default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['remi-php56']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php56/$basearch/"
  default['yum']['remi-php56']['mirrorlist'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php56/mirror"
  default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
