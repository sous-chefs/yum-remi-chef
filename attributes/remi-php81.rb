default['yum']['remi-php81']['repositoryid'] = 'remi-php81'
default['yum']['remi-php81']['gpgcheck'] = true
default['yum']['remi-php81']['enabled'] = true
default['yum']['remi-php81']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-php81']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php81/$basearch/"
  default['yum']['remi-php81']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php81/$basearch/mirror"
  default['yum']['remi-php81']['description'] = "Remi's PHP 8.1 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-php81']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php81/$basearch/"
  default['yum']['remi-php81']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php81/mirror"
                                               else
                                                 "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php81/$basearch/mirror"
                                               end
  default['yum']['remi-php81']['description'] = "Remi's PHP 8.1 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
