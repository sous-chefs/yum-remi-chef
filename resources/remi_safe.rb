provides :yum_remi_safe
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('safe') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('safe') }
property :description, String, default: lazy { remi_repo_description('safe') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-safe') }
property :debug_description, String, default: lazy { remi_repo_description('debug-safe') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  include_recipe 'yum-epel' unless fedora?

  yum_repository 'remi-safe' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-safe-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
