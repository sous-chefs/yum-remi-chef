provides :yum_remi_php73
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php73') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php73') }
property :description, String, default: lazy { remi_repo_description('php73') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php73') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php73') }

action :create do
  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-7.3'
end
