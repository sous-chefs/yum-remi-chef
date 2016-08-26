default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['enabled'] = true
default['yum']['remi']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi']['mirrorlist'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/mirror"
  default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi']['baseurl'] = 'http://rpms.remirepo.net/enterprise/6/remi/$basearch/'
  default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/remi/mirror'
  default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['remi']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi']['mirrorlist'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/mirror"
  default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
