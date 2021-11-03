package "php#{node['remi-test']['version'].delete('.')}" do
  # fedora phpXX repos dont have the version prefix
  package_name 'php' if platform_family?('fedora')
end
