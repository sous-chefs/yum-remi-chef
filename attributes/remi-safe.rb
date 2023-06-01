default['yum']['remi-safe']['repositoryid'] = 'remi-safe'
default['yum']['remi-safe']['gpgcheck'] = true
default['yum']['remi-safe']['enabled'] = true
default['yum']['remi-safe']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-safe']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi-safe']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/safe/$basearch/mirror"
  default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-safe']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi-safe']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/safe/mirror"
                                              else
                                                "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/safe/$basearch/mirror"
                                              end
  default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
