provides :yum_remi_modular
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('modular') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('modular') }
property :description, String, default: lazy { remi_repo_description('modular') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-modular') }
property :debug_description, String, default: lazy { remi_repo_description('debug-modular') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  raise "`remi-modular` is not available for #{node['platform']} #{node['platform_version'].to_i}" if rhel_7?

  yum_remi 'default'

  yum_repository 'remi-modular' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-modular-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
