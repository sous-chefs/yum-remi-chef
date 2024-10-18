provides :yum_remi_php81
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php81') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php81') }
property :description, String, default: lazy { remi_repo_description('php81') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php81') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php81') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.1'
end
