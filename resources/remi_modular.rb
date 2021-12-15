resource_name :yum_remi_modular
provides :yum_remi_modular
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('modular') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('modular') }
property :description, String, default: lazy { remi_repo_description('modular') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-modular') }
property :debug_description, String, default: lazy { remi_repo_description('debug-modular') }
property :debug_enabled, [true, false], default: false

action :create do
  raise "`remi-modular` is not available for #{node['platform']} #{node['platform_version'].to_i}" if rhel_7_or_amazon?

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
  end
end
