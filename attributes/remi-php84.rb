default['yum']['remi-php84']['repositoryid'] = 'remi-php84'
default['yum']['remi-php84']['gpgcheck'] = true
default['yum']['remi-php84']['enabled'] = true
default['yum']['remi-php84']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php84']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php84/$basearch/"
  default['yum']['remi-php84']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php84/$basearch/mirror"
  default['yum']['remi-php84']['description'] = "Remi's PHP 8.4 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php84']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php84/$basearch/"
  default['yum']['remi-php84']['mirrorlist'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php84/$basearch/mirror"
  default['yum']['remi-php84']['description'] = "Remi's PHP 8.4 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
