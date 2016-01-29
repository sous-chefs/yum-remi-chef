default['yum']['remi-php70-test-debuginfo']['repositoryid'] = 'remi-php70-test-debuginfo'
default['yum']['remi-php70-test-debuginfo']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi-php70-test-debuginfo']['gpgcheck'] = true
default['yum']['remi-php70-test-debuginfo']['enabled'] = false
default['yum']['remi-php70-test-debuginfo']['managed'] = false

case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 20
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/fedora/20/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 20 - $basearch - debuginfo"
  when 21
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/fedora/21/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 21 - $basearch - debuginfo"
  when 22
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/fedora/22/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 22 - $basearch - debuginfo"
  when 23
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/fedora/23/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Fedora Linux 23 - $basearch - debuginfo"
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/enterprise/5/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 5 - $basearch - debuginfo"
  when 6, 2013, 2014, 2015
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 6 - $basearch - debuginfo"
  when 7
    default['yum']['remi-php70-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/debug-test70/$basearch/'
    default['yum']['remi-php70-test-debuginfo']['description'] = "Remi's PHP 7.0 test RPM repository for Enterprise Linux 7 - $basearch - debuginfo"
  end
end
