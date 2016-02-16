default['yum']['remi-php56-debuginfo']['repositoryid'] = 'remi-php56-debuginfo'
default['yum']['remi-php56-debuginfo']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php56-debuginfo']['gpgcheck'] = true
default['yum']['remi-php56-debuginfo']['enabled'] = false
default['yum']['remi-php56-debuginfo']['managed'] = false

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    default['yum']['remi-php56-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/fedora/20/debug-php56/$basearch/'
    default['yum']['remi-php56-debuginfo']['description'] = 'Les RPM de remi de PHP 5.6 pour Fedora Linux 20 - $basearch - debuginfo'
  when 21
    default['yum']['remi-php56-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/fedora/21/debug-php56/$basearch/'
    default['yum']['remi-php56-debuginfo']['description'] = 'Les RPM de remi de php 5.6 pour Fedora Linux 21 - $basearch - debuginfo'
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php56-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/debug-php56/$basearch/'
    default['yum']['remi-php56-debuginfo']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 5 - $basearch - debuginfo'
  when 6, 2013, 2014, 2015
    default['yum']['remi-php56-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-php56/$basearch/'
    default['yum']['remi-php56-debuginfo']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 6 - $basearch - debuginfo'
  when 7
    default['yum']['remi-php56-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/debug-php56/$basearch/'
    default['yum']['remi-php56-debuginfo']['description'] = 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 7 - $basearch - debuginfo'
  end
end
