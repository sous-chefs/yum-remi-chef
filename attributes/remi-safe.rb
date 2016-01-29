default['yum']['remi-safe']['repositoryid'] = 'remi-safe'
default['yum']['remi-safe']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-safe']['gpgcheck'] = true
default['yum']['remi-safe']['enabled'] = true
default['yum']['remi-safe']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux 20 - $basearch"
  when 21
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/21/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux 21 - $basearch"
  when 22
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/22/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux 22 - $basearch"
  when 23
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/fedora/23/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/23/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi-safe']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/safe/$basearch/'
    default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/safe/mirror'
    default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 7 - $basearch"
  end
end
