default['yum']['remi-safe']['repositoryid'] = 'remi-safe'
default['yum']['remi-safe']['gpgcheck'] = true
default['yum']['remi-safe']['enabled'] = true
default['yum']['remi-safe']['managed'] = true

case node['platform']
when 'fedora'
  # default['yum']['remi-safe']['baseurl'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi-safe']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/safe/mirror"
  default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'
  # Default to EL6
  # default['yum']['remi-safe']['baseurl'] = 'http://cdn.remirepo.net/enterprise/6/remi/$basearch/'
  default['yum']['remi-safe']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/6/safe/mirror'
  default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 6 - $basearch"
else
  # default['yum']['rem-safei']['baseurl'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/remi/$basearch/"
  default['yum']['remi-safe']['mirrorlist'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/safe/mirror"
  default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
