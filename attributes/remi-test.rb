default['yum']['remi-test']['repositoryid'] = 'remi-test'
default['yum']['remi-test']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-test']['gpgcheck'] = true
default['yum']['remi-test']['enabled'] = true
default['yum']['remi-test']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Fedora Linux 20 - $basearch"
  when 21
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/21/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Fedora Linux 21 - $basearch"
  when 22
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/22/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Fedora Linux 22 - $basearch"
  when 23
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/test/$basearch/'
    default['yum']['remi-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/test/mirror'
    default['yum']['remi-test']['description'] = "Remi's test RPM repository for Enterprise Linux 7 - $basearch"
  end
end
