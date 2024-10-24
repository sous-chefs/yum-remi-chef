default['yum']['remi-php83']['repositoryid'] = 'remi-php83'
default['yum']['remi-php83']['gpgcheck'] = true
default['yum']['remi-php83']['enabled'] = true
default['yum']['remi-php83']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php83']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php83/$basearch/"
  default['yum']['remi-php83']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php83/$basearch/mirror"
  default['yum']['remi-php83']['description'] = "Remi's PHP 8.3 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php83']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php83/$basearch/"
  default['yum']['remi-php83']['mirrorlist'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php83/$basearch/mirror"
  default['yum']['remi-php83']['description'] = "Remi's PHP 8.3 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
