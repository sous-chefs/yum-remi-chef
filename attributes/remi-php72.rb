default['yum']['remi-php72']['repositoryid'] = 'remi-php72'
default['yum']['remi-php72']['gpgcheck'] = true
default['yum']['remi-php72']['enabled'] = true
default['yum']['remi-php72']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php72']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php72/$basearch/"
  default['yum']['remi-php72']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php72/$basearch/mirror"
  default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php72']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php72/$basearch/"
  default['yum']['remi-php72']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php72/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php72/$basearch/mirror"
                                               end
  default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
