provides :yum_remi_php71
unified_mode true

use '_partials/_common'

property :baseurl, String, default: lazy { remi_repo_baseurl('php71') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php71') }
property :description, String, default: lazy { remi_repo_description('php71') }

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-php71') }
property :debug_description, String, default: lazy { remi_repo_description('debug-php71') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  raise "`remi-php71` is not available for #{node['platform']} #{node['platform_version'].to_i}" if rhel_8_or_fedora?

  yum_remi 'default'

  # use repo on C7
  yum_repository 'remi-php71' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-php71-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end if new_resource.debug_enabled
end
