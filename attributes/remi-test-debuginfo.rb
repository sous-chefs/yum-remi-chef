default['yum']['remi-test-debuginfo']['repositoryid'] = 'remi'
default['yum']['remi-test-debuginfo']['gpgcheck'] = true
default['yum']['remi-test-debuginfo']['enabled'] = false
default['yum']['remi-test-debuginfo']['managed'] = false

case node['platform_family']
when 'fedora'
when 'amazon'
  # Default to EL7
end

case node['platform_family']
when 'fedora'
  default['yum']['remi-test-debuginfo']['baseurl'] = "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/debug-test/$basearch/"
  default['yum']['remi-test-debuginfo']['description'] = "Remi's test RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
when 'amazon'
  # Use CentOS 7 repo
  default['yum']['remi-test-debuginfo']['baseurl'] = 'http://rpms.remirepo.net/enterprise/7/debug-test/$basearch/'
  default['yum']['remi-test-debuginfo']['description'] = "Remi's test RPM repository for Enterprise Linux 7 - $basearch - debuginfo"
when 'rhel'
  default['yum']['remi-test-debuginfo']['baseurl'] = "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/debug-test/$basearch/"
  default['yum']['remi-test-debuginfo']['description'] = "Remi's test RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch - debuginfo"
else
  raise "platform #{node['platform']} not recognised"
end
