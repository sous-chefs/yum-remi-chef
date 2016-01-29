default['yum']['remi-dev']['repositoryid'] = 'remi-dev'
default['yum']['remi-dev']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-dev']['gpgcheck'] = true
default['yum']['remi-dev']['enabled'] = false
default['yum']['remi-dev']['managed'] = false

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Fedora Linux 20 - $basearch"
  when 21
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Fedora Linux 21 - $basearch"
  when 22
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Fedora Linux 22 - $basearch"
  when 23
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Enterprise Linux 5 - $basearch"
  when 6
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    default['yum']['remi-dev']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/devs/$basearch/'
    default['yum']['remi-dev']['description'] = "Remi's development RPM repository for Enterprise Linux 7 - $basearch"
  end
end
