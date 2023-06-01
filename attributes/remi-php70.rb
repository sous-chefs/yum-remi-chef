default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php70']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php70/$basearch/"
  default['yum']['remi-php70']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php70/$basearch/mirror"
  default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php70']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php70/$basearch/"
  default['yum']['remi-php70']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php70/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php70/$basearch/mirror"
                                               end
  default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
