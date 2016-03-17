default['yum']['remi-php70-debuginfo']['repositoryid'] = 'remi-php70-debuginfo'
default['yum']['remi-php70-debuginfo']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php70-debuginfo']['gpgcheck'] = true
default['yum']['remi-php70-debuginfo']['enabled'] = false
default['yum']['remi-php70-debuginfo']['managed'] = false

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    default['yum']['remi-php70-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/fedora/20/debug-php70/$basearch/'
    default['yum']['remi-php70-debuginfo']['description'] = 'Les RPM de remi de PHP 7.0 pour Fedora Linux 20 - $basearch - debuginfo'
  when 21
    default['yum']['remi-php70-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/fedora/21/debug-php70/$basearch/'
    default['yum']['remi-php70-debuginfo']['description'] = 'Les RPM de remi de php 7.0 pour Fedora Linux 21 - $basearch - debuginfo'
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php70-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/debug-php70/$basearch/'
    default['yum']['remi-php70-debuginfo']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 5 - $basearch - debuginfo'
  when 6
    default['yum']['remi-php70-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-php70/$basearch/'
    default['yum']['remi-php70-debuginfo']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 6 - $basearch - debuginfo'
  when 7
    default['yum']['remi-php70-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/debug-php70/$basearch/'
    default['yum']['remi-php70-debuginfo']['description'] = 'Les RPM de remi de PHP 7.0 pour Enterprise Linux 7 - $basearch - debuginfo'
  end
end
