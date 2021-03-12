default['yum']['remi-php55-debuginfo']['repositoryid'] = 'remi-php55-debuginfo'
default['yum']['remi-php55-debuginfo']['gpgcheck'] = true
default['yum']['remi-php55-debuginfo']['enabled'] = false
default['yum']['remi-php55-debuginfo']['managed'] = false

case node['platform']
when 'fedora'
  default['yum']['remi-php55-debuginfo']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-php55/$basearch/"
  default['yum']['remi-php55-debuginfo']['description'] = "Remi's PHP 5.5 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
when 'amazon'
  # Default to EL7
  default['yum']['remi-php55-debuginfo']['baseurl'] = 'http://cdn.remirepo.net/enterprise/7/debug-php55/$basearch/'
  default['yum']['remi-php55-debuginfo']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 7 - $basearch - debuginfo"
else
  default['yum']['remi-php55-debuginfo']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-php55/$basearch/"
  default['yum']['remi-php55-debuginfo']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
end
