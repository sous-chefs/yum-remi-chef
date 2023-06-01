default['yum']['remi-test']['repositoryid'] = 'remi-test'
default['yum']['remi-test']['gpgcheck'] = true
default['yum']['remi-test']['enabled'] = false
default['yum']['remi-test']['managed'] = false

case node['platform_family']
when 'fedora'
  # default['yum']['remi-test']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/test/$basearch/"
  default['yum']['remi-test']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/test/$basearch/mirror"
  default['yum']['remi-test']['description'] = "Remi's test RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-safe']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/test/$basearch/"
  default['yum']['remi-test']['mirrorlist'] = if node['platform_version'].to_i == 7
                                                "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/test/mirror"
                                              else
                                                "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/test/$basearch/mirror"
                                              end
  default['yum']['remi-test']['description'] = "Remi's test RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
