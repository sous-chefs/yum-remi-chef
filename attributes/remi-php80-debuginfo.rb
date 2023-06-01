default['yum']['remi-php80-debuginfo']['repositoryid'] = 'remi-php80-debuginfo'
default['yum']['remi-php80-debuginfo']['gpgcheck'] = true
default['yum']['remi-php80-debuginfo']['enabled'] = false
default['yum']['remi-php80-debuginfo']['managed'] = false

if platform_family?('fedora')
  default['yum']['remi-php80-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php80/$basearch/"
  default['yum']['remi-php80-debuginfo']['description'] = "Remi's PHP 8.0 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-php80-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php80/$basearch/"
  default['yum']['remi-php80-debuginfo']['description'] = "Remi's PHP 8.0 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
