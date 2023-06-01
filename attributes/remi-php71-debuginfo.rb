default['yum']['remi-php71-debuginfo']['repositoryid'] = 'remi-php71-debuginfo'
default['yum']['remi-php71-debuginfo']['gpgcheck'] = true
default['yum']['remi-php71-debuginfo']['enabled'] = false
default['yum']['remi-php71-debuginfo']['managed'] = false

if platform_family?('fedora')
  default['yum']['remi-php71-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php71/$basearch/"
  default['yum']['remi-php71-debuginfo']['description'] = "Remi's PHP 7.1 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-php71-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php71/$basearch/"
  default['yum']['remi-php71-debuginfo']['description'] = "Remi's PHP 7.1 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
