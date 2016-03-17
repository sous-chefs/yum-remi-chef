default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/fedora/20/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Fedora Linux 20 - $basearch'
  when 21
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/fedora/21/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de php 7.0 pour Fedora Linux 21 - $basearch'
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 5 - $basearch'
  when 6
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 7 - $basearch'
  end
end
