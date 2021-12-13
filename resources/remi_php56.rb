resource_name :yum_remi_php56
provides :yum_remi_php56
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('php56') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php56') }
property :description, String, default: lazy { remi_repo_description('php56') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  raise "`remi-php56` is not available for #{node['platform']} #{node['platform_version']}}" if rhel_8_or_fedora?

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
end
