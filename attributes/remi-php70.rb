default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux 20 - $basearch"
  when 21
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/21/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux 21 - $basearch"
  when 22
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/22/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux 22 - $basearch"
  when 23
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/fedora/23/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/23/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi-php70']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/php70/$basearch/'
    default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/php70/mirror'
    default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 7 - $basearch"
  end
end
