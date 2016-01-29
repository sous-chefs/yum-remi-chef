default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['enabled'] = true
default['yum']['remi']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux 20 - $basearch"
  when 21
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/21/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux 21 - $basearch"
  when 22
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/22/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux 22 - $basearch"
  when 23
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/fedora/23/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/23/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/remi/$basearch/'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/remi/mirror'
    default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 7 - $basearch"
  end
end
