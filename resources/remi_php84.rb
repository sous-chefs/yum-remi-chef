provides :yum_remi_php84
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php84') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php84') }
property :description, String, default: lazy { remi_repo_description('php84') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php84') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php84') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.4'
end
