default['yum']['remi-php84-debuginfo']['repositoryid'] = 'remi-php84-debuginfo'
default['yum']['remi-php84-debuginfo']['gpgcheck'] = true
default['yum']['remi-php84-debuginfo']['enabled'] = false
default['yum']['remi-php84-debuginfo']['managed'] = false

if platform_family?('fedora')
  default['yum']['remi-php84-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php84/$basearch/"
  default['yum']['remi-php84-debuginfo']['description'] = "Remi's PHP 8.4 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-php84-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php84/$basearch/"
  default['yum']['remi-php84-debuginfo']['description'] = "Remi's PHP 8.4 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
