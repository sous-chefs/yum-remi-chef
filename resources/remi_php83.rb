provides :yum_remi_php83
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php83') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php83') }
property :description, String, default: lazy { remi_repo_description('php83') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php83') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php83') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.3'
end
