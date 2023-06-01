default['yum']['remi-php81-debuginfo']['repositoryid'] = 'remi-php81-debuginfo'
default['yum']['remi-php81-debuginfo']['gpgcheck'] = true
default['yum']['remi-php81-debuginfo']['enabled'] = false
default['yum']['remi-php81-debuginfo']['managed'] = false

if platform_family?('fedora')
  default['yum']['remi-php81-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php81/$basearch/"
  default['yum']['remi-php81-debuginfo']['description'] = "Remi's PHP 8.1 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  default['yum']['remi-php81-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php81/$basearch/"
  default['yum']['remi-php81-debuginfo']['description'] = "Remi's PHP 8.1 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
