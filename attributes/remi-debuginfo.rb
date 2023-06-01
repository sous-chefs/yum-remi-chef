default['yum']['remi-debuginfo']['repositoryid'] = 'remi-debuginfo'
default['yum']['remi-debuginfo']['gpgcheck'] = true
default['yum']['remi-debuginfo']['enabled'] = false
default['yum']['remi-debuginfo']['managed'] = false

case node['platform_family']
when 'fedora'
  default['yum']['remi-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-remi/$basearch/"
  default['yum']['remi-debuginfo']['description'] = "Remi's RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
when 'rhel'
  default['yum']['remi-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-remi/$basearch/"
  default['yum']['remi-debuginfo']['description'] = "Remi's RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
