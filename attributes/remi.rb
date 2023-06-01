default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['enabled'] = true
default['yum']['remi']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/$basearch/mirror"
  default['yum']['remi']['description'] = "Remi's RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi']['mirrorlist'] = if node['platform_version'].to_i == 7
                                           "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/mirror"
                                         else
                                           "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/$basearch/mirror"
                                         end
  default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
