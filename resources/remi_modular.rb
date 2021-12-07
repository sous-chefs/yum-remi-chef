resource_name :yum_remi_modular
provides :yum_remi_modular
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('modular') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('modular') }
property :description, String, default: lazy { remi_repo_description('modular') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  raise "`remi-modular` is not available for #{node['platform']} #{node['platform_version']}}" if rhel_7_or_amazon?

  yum_remi 'default'

  yum_repository 'remi-modular' do
    baseurl new_resource.baseurl
    gpgcheck new_resource.gpgcheck
    enabled new_resource.enabled
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    gpgkey new_resource.gpgkey
  end
end
