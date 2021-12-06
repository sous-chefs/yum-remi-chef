resource_name :yum_remi
provides :yum_remi
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('remi') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('remi') }
property :description, String, default: lazy { remi_repo_description('remi') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  yum_remi_safe 'default' unless fedora?

  yum_repository 'remi' do
    baseurl new_resource.baseurl
    gpgcheck new_resource.gpgcheck
    enabled new_resource.enabled
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    gpgkey new_resource.gpgkey
  end
end
