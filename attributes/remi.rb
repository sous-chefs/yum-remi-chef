default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['enabled'] = true
default['yum']['remi']['managed'] = true

case node['platform']
when 'amazon'
  default['yum']['remi']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/remi/$basearch/'
  default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 6 - $basearch'
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/remi/$basearch/'
    default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 5 - $basearch'
  when 6
    default['yum']['remi']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/remi/$basearch/'
    default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/remi/$basearch/'
    default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 7 - $basearch'
  end
end
