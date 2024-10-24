provides :yum_remi_php74
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php74') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php74') }
property :description, String, default: lazy { remi_repo_description('php74') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php74') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php74') }

action :create do
  raise "`remi-php74` is not available for #{node['platform']} #{node['platform_version'].to_i}" if fedora?

  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-7.4'
end
