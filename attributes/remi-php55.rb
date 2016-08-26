default['yum']['remi-php55']['repositoryid'] = 'remi-php55'
default['yum']['remi-php55']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php55']['gpgcheck'] = true
default['yum']['remi-php55']['enabled'] = true
default['yum']['remi-php55']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi-php55']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php55/$basearch/"
  default['yum']['remi-php55']['mirrorlist'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php55/mirror"
  default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi-php55']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php55/$basearch/'
  default['yum']['remi-php55']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php55/mirror'
  default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['remi-php55']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php55/$basearch/"
  default['yum']['remi-php55']['mirrorlist'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php55/mirror"
  default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
