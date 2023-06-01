provides :yum_remi_php56
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php56') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php56') }
property :description, String, default: lazy { remi_repo_description('php56') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php56') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php56') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  raise "`remi-php56` is not available for #{node['platform']} #{node['platform_version'].to_i}" if rhel_8_or_fedora?

  yum_remi 'default'

  # use repo on C7
  yum_repository 'remi-php56' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-php56-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
