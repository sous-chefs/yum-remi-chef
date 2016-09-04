default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi-php70']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php70/$basearch/"
  default['yum']['remi-php70']['mirrorlist'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php70/mirror"
  default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php70/$basearch/'
  default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php70/mirror'
  default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['remi-php70']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php70/$basearch/"
  default['yum']['remi-php70']['mirrorlist'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/php70/mirror"
  default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
