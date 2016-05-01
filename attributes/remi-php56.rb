default['yum']['remi-php56']['repositoryid'] = 'remi-php56'
default['yum']['remi-php56']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php56']['gpgcheck'] = true
default['yum']['remi-php56']['enabled'] = true
default['yum']['remi-php56']['managed'] = true

case node['platform']
when 'fedora'
  default['yum']['remi-php56']['baseurl'] = "http://rpms.famillecollet.com/fedora/#{node['platform_version'].to_i}/php56/$basearch/"
  default['yum']['remi-php56']['description'] = "Les RPM de remi de PHP 5.6 pour Fedora Linux #{node['platform_version'].to_i} - $basearch"
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php56']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/php56/$basearch/'
    default['yum']['remi-php56']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 5 - $basearch'
  when 6, 2013, 2014, 2015, 2016
    default['yum']['remi-php56']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/php56/$basearch/'
    default['yum']['remi-php56']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi-php56']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/php56/$basearch/'
    default['yum']['remi-php56']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 7 - $basearch'
  end
end
