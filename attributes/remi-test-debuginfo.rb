default['yum']['remi-test']['repositoryid'] = 'remi'
default['yum']['remi-test']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-test']['gpgcheck'] = true
default['yum']['remi-test']['enabled'] = false
default['yum']['remi-test']['managed'] = false

case node['platform']
when 'amazon'
  default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/remi/$basearch/'
  default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 6 - $basearch'
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/remi/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 5 - $basearch'
  when 6
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/remi/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/remi/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 7 - $basearch'
  end
end
