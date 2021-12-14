resource_name :yum_remi_php81
provides :yum_remi_php81
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('php81') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php81') }
property :description, String, default: lazy { remi_repo_description('php81') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  yum_remi 'default'

  # use repo on C7
  if rhel_7_or_amazon?
    yum_repository 'remi-php81' do
      baseurl new_resource.baseurl
      mirrorlist new_resource.mirrorlist
      description new_resource.description
      enabled new_resource.enabled
      gpgcheck new_resource.gpgcheck
      gpgkey new_resource.gpgkey
      # amazon base repo has priority 10, need to override to get the correct php version
      priority '9' if amazon?
    end
  else
    # use modules on C8 / Fedora
    yum_remi_modular 'default'

    dnf_module 'php:remi-8.1'
  end
end
