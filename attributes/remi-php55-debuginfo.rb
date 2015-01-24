default['yum']['remi-php55-debuginfo']['repositoryid'] = 'remi-php55-debuginfo'
default['yum']['remi-php55-debuginfo']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-php55-debuginfo']['gpgcheck'] = true
default['yum']['remi-php55-debuginfo']['enabled'] = false
default['yum']['remi-php55-debuginfo']['managed'] = false

case node['platform']
when 'amazon'
  default['yum']['remi-php55-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-php55/$basearch/'
  default['yum']['remi-php55-debuginfo']['description'] = 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 6 - $basearch - debuginfo'
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php55-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/debug-php55/$basearch/'
    default['yum']['remi-php55-debuginfo']['description'] = 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 5 - $basearch - debuginfo'
  when 6
    default['yum']['remi-php55-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-php55/$basearch/'
    default['yum']['remi-php55-debuginfo']['description'] = 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 6 - $basearch - debuginfo'
  when 7
    default['yum']['remi-php55-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/debug-php55/$basearch/'
    default['yum']['remi-php55-debuginfo']['description'] = 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 7 - $basearch - debuginfo'
  end
end
