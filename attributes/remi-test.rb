default['yum']['remi-test']['repositoryid'] = 'remi'
default['yum']['remi-test']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['yum']['remi-test']['gpgcheck'] = true
default['yum']['remi-test']['enabled'] = false
default['yum']['remi-test']['managed'] = false

case node['platform']
when 'fedora'
  default['yum']['remi-test']['baseurl'] = "http://rpms.famillecollet.com/fedora/#{node['platform_version'].to_i}/remi-test/$basearch/"
  default['yum']['remi-test']['description'] = "Les RPM de remi de PHP 5.6 pour Fedora Linux #{node['platform_version'].to_i} - $basearch"
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/5/remi-test/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 5 - $basearch'
  when 6, 2013, 2014, 2015, 2016
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/6/remi-test/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 6 - $basearch'
  when 7
    default['yum']['remi-test']['baseurl'] = 'http://rpms.famillecollet.com/enterprise/7/remi-test/$basearch/'
    default['yum']['remi-test']['description'] = 'Les RPM de remi en test pour Enterprise Linux 7 - $basearch'
  end
end
