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
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi-php56']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/php56/$basearch/'
    default['yum']['remi-php56']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/php56/mirror'
    default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015, 2016
    # default['yum']['remi-php56']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php56/$basearch/'
    default['yum']['remi-php56']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php56/mirror'
    default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi-php56']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/php56/$basearch/'
    default['yum']['remi-php56']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/php56/mirror'
    default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 7 - $basearch"
  end
end
