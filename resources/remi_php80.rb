provides :yum_remi_php80
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php80') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php80') }
property :description, String, default: lazy { remi_repo_description('php80') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php80') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php80') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.0'
end
