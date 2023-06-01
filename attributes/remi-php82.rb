default['yum']['remi-php82']['repositoryid'] = 'remi-php82'
default['yum']['remi-php82']['gpgcheck'] = true
default['yum']['remi-php82']['enabled'] = true
default['yum']['remi-php82']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php82']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php82/$basearch/"
  default['yum']['remi-php82']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php82/$basearch/mirror"
  default['yum']['remi-php82']['description'] = "Remi's PHP 8.2 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php82']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php82/$basearch/"
  default['yum']['remi-php82']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php82/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php82/$basearch/mirror"
                                               end
  default['yum']['remi-php82']['description'] = "Remi's PHP 8.2 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
