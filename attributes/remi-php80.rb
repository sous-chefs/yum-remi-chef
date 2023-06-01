default['yum']['remi-php80']['repositoryid'] = 'remi-php80'
default['yum']['remi-php80']['gpgcheck'] = true
default['yum']['remi-php80']['enabled'] = true
default['yum']['remi-php80']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php80']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php80/$basearch/"
  default['yum']['remi-php80']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php80/$basearch/mirror"
  default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php80']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php80/$basearch/"
  default['yum']['remi-php80']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php80/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php80/$basearch/mirror"
                                               end
  default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
