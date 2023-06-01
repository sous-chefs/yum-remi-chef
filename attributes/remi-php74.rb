default['yum']['remi-php74']['repositoryid'] = 'remi-php74'
default['yum']['remi-php74']['gpgcheck'] = true
default['yum']['remi-php74']['enabled'] = true
default['yum']['remi-php74']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php74']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php74/$basearch/"
  default['yum']['remi-php74']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php74/$basearch/mirror"
  default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php74']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php74/$basearch/"
  default['yum']['remi-php74']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php74/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php74/$basearch/mirror"
                                               end
  default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
