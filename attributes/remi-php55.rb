default['yum']['remi-php55']['repositoryid'] = 'remi-php55'
default['yum']['remi-php55']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php55']['gpgcheck'] = true
default['yum']['remi-php55']['enabled'] = true
default['yum']['remi-php55']['managed'] = true

case node['platform']
when 'fedora'
  default['yum']['remi-php55']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/php55/$basearch/"
  default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php55']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/php55/$basearch/'
    default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    default['yum']['remi-php55']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php55/$basearch/'
    default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    default['yum']['remi-php55']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/php55/$basearch/'
    default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 7 - $basearch"
  end
end
