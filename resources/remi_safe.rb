resource_name :yum_remi_safe
provides :yum_remi_safe
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('safe') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('safe') }
property :description, String, default: lazy { remi_repo_description('safe') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

action :create do
  include_recipe 'yum-epel' unless fedora?

  yum_repository 'remi-safe' do
    baseurl new_resource.baseurl
    gpgcheck new_resource.gpgcheck
    enabled new_resource.enabled
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    gpgkey new_resource.gpgkey
  end
end
