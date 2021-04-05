default['yum']['remi-php80']['repositoryid'] = 'remi-php80'
default['yum']['remi-php80']['gpgcheck'] = true
default['yum']['remi-php80']['enabled'] = true
default['yum']['remi-php80']['managed'] = true

case node['platform']
when 'fedora'
  default['yum']['remi-php80']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php80/mirror"
  default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  default['yum']['remi-php80']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/7/php80/mirror'
  default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Enterprise Linux 7 - $basearch"
else
  default['yum']['remi-php80']['mirrorlist'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php80/mirror"
  default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
