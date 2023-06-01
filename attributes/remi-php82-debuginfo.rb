default['yum']['remi-php82-debuginfo']['repositoryid'] = 'remi-php82-debuginfo'
default['yum']['remi-php82-debuginfo']['gpgcheck'] = true
default['yum']['remi-php82-debuginfo']['enabled'] = false
default['yum']['remi-php82-debuginfo']['managed'] = false

if platform_family?('fedora')
  default['yum']['remi-php82-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php82/$basearch/"
  default['yum']['remi-php82-debuginfo']['description'] = "Remi's PHP 8.2 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-php82-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php82/$basearch/"
  default['yum']['remi-php82-debuginfo']['description'] = "Remi's PHP 8.2 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
