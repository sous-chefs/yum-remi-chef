default['yum']['remi-php70-test']['repositoryid'] = 'remi-php70-test'
default['yum']['remi-php70-test']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php70-test']['gpgcheck'] = true
default['yum']['remi-php70-test']['enabled'] = true
default['yum']['remi-php70-test']['managed'] = true

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/20/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 20 - $basearch"
  when 21
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/21/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 21 - $basearch"
  when 22
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/22/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 22 - $basearch"
  when 23
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/fedora/23/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/fedora/23/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 23 - $basearch"
  end
else
  case node['platform_version'].to_i
  when 5
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 5 - $basearch"
  when 6, 2013, 2014, 2015
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 6 - $basearch"
  when 7
    # default['yum']['remi-php70-test']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/test70/$basearch/'
    default['yum']['remi-php70-test']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/7/test70/mirror'
    default['yum']['remi-php70-test']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 7 - $basearch"
  end
end
