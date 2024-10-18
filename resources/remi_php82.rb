provides :yum_remi_php82
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php82') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php82') }
property :description, String, default: lazy { remi_repo_description('php82') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php82') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php82') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.2'
end
