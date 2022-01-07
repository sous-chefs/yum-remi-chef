default['yum']['remi-modular-debuginfo']['repositoryid'] = 'remi-modular-debuginfo'
default['yum']['remi-modular-debuginfo']['gpgcheck'] = true
default['yum']['remi-modular-debuginfo']['enabled'] = false
default['yum']['remi-modular-debuginfo']['managed'] = false

if fedora?
  default['yum']['remi-modular-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-modular/$basearch/"
  default['yum']['remi-modular-debuginfo']['description'] = "Remi's Modular repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-modular-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-modular/$basearch/"
  default['yum']['remi-modular-debuginfo']['description'] = "Remi's Modular repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
