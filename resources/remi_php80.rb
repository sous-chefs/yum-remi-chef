resource_name :yum_remi_php80
provides :yum_remi_php80
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('php80') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php80') }
property :description, String, default: lazy { remi_repo_description('php80') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  yum_remi 'default'

  # use repo on C7
  if rhel_7_or_amazon?
    yum_repository 'remi-php80' do
      baseurl new_resource.baseurl
      mirrorlist new_resource.mirrorlist
      description new_resource.description
      enabled new_resource.enabled
      gpgcheck new_resource.gpgcheck
      gpgkey new_resource.gpgkey
    end
  else
    # use modules on C8 / Fedora
    yum_remi_modular 'default'

    dnf_module 'php:remi-8.0'
  end
end
