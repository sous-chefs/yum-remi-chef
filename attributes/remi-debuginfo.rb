default['yum']['remi-debuginfo']['repositoryid'] = 'remi-debuginfo'
default['yum']['remi-debuginfo']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-debuginfo']['gpgcheck'] = true
default['yum']['remi-debuginfo']['enabled'] = false
default['yum']['remi-debuginfo']['managed'] = false

case node['platform']
when 'amazon'
  default['yum']['remi-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-remi/$basearch/'
  default['yum']['remi-debuginfo']['description'] = 'Les RPM de remi pour Enterprise Linux 6 - $basearch - debuginfo'
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/debug-remi/$basearch/'
    default['yum']['remi-debuginfo']['description'] = 'Les RPM de remi pour Enterprise Linux 5 - $basearch - debuginfo'
  when 6
    default['yum']['remi-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/debug-remi/$basearch/'
    default['yum']['remi-debuginfo']['description'] = 'Les RPM de remi pour Enterprise Linux 6 - $basearch - debuginfo'
  when 7
    default['yum']['remi-debuginfo']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/debug-remi/$basearch/'
    default['yum']['remi-debuginfo']['description'] = 'Les RPM de remi pour Enterprise Linux 7 - $basearch - debuginfo'
  end
end
