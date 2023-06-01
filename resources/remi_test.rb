provides :yum_remi_test
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('test') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('test') }
property :description, String, default: lazy { remi_repo_description('test') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-test') }
property :debug_description, String, default: lazy { remi_repo_description('debug-test') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  yum_remi 'default'

  yum_repository 'remi-test' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-test-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
