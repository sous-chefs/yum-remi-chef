default['yum']['remi-php73']['repositoryid'] = 'remi-php73'
default['yum']['remi-php73']['gpgcheck'] = true
default['yum']['remi-php73']['enabled'] = true
default['yum']['remi-php73']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php73']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php73/$basearch/"
  default['yum']['remi-php73']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php73/$basearch/mirror"
  default['yum']['remi-php73']['description'] = "Remi's PHP 7.3 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php73']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php73/$basearch/"
  default['yum']['remi-php73']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php73/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php73/$basearch/mirror"
                                               end
  default['yum']['remi-php73']['description'] = "Remi's PHP 7.3 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
