provides :yum_remi
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('remi') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('remi') }
property :description, String, default: lazy { remi_repo_description('remi') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-remi') }
property :debug_description, String, default: lazy { remi_repo_description('debug-remi') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  yum_remi_safe 'default' unless fedora?

  yum_repository 'remi' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
