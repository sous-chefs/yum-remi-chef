default['yum']['remi-modular']['repositoryid'] = 'remi-modular'
default['yum']['remi-modular']['gpgcheck'] = true
default['yum']['remi-modular']['enabled'] = true
default['yum']['remi-modular']['managed'] = true

case node['platform_family']
when 'fedora'
  # default['yum']['remi-modular']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/modular/$basearch/"
  default['yum']['remi-modular']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/modular/$basearch/mirror"
  default['yum']['remi-modular']['description'] = "Remi's Modular repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'rhel'
  # default['yum']['remi-modular']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/modular/$basearch/"
  default['yum']['remi-modular']['mirrorlist'] =  "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/modular/$basearch/mirror"
  default['yum']['remi-modular']['description'] = "Remi's Modular repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
