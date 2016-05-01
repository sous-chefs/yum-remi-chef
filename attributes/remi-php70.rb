default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['managed'] = true

case node['platform']
when 'fedora'
  default['yum']['remi-php70']['baseurl'] = "http://rpms.famillecollet.com/fedora/#{node['platform_version'].to_i}/php70/$basearch/"
  default['yum']['remi-php70']['description'] = "Les RPM de remi de PHP 7.0 pour Fedora Linux #{node['platform_version'].to_i} - $basearch"
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 5 - $basearch'
  when 6, 2013, 2014, 2015, 2016
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi-php70']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/php70/$basearch/'
    default['yum']['remi-php70']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 7 - $basearch'
  end
end
