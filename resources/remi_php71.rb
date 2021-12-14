resource_name :yum_remi_php71
provides :yum_remi_php71
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('php71') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('php71') }
property :description, String, default: lazy { remi_repo_description('php71') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  raise "`remi-php71` is not available for #{node['platform']} #{node['platform_version']}}" if rhel_8_or_fedora?

  yum_remi 'default'

  # use repo on C7
  yum_repository 'remi-php71' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
    # amazon base repo has priority 10, need to override to get the correct php version
    priority '9' if amazon?
  end
end
