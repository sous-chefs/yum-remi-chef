provides :yum_remi_php82
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php82') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php82') }
property :description, String, default: lazy { remi_repo_description('php82') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php82') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php82') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  yum_remi 'default'

  # use repo on C7
  if rhel_7?
    yum_repository 'remi-php82' do
      baseurl new_resource.baseurl
      mirrorlist new_resource.mirrorlist
      description new_resource.description
      enabled new_resource.enabled
      gpgcheck new_resource.gpgcheck
      gpgkey new_resource.gpgkey
    end

    yum_repository 'remi-php82-debuginfo' do
      baseurl new_resource.debug_baseurl
      description new_resource.debug_description
      enabled new_resource.debug_enabled
      gpgcheck new_resource.gpgcheck
      gpgkey new_resource.gpgkey
    end if new_resource.debug_enabled
  else
    # use modules on C8 / Fedora
    yum_remi_modular 'default'

    dnf_module 'php:remi-8.2'
  end
end
