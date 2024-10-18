provides :yum_remi_php72
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php72') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php72') }
property :description, String, default: lazy { remi_repo_description('php72') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php72') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php72') }

action :create do
  raise "`remi-php72` is not available for #{node['platform']} #{node['platform_version'].to_i}" if fedora?

  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-7.2'
end
