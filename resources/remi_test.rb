provides :yum_remi_test
unified_mode true

property :baseurl, String, default: lazy { remi_repo_baseurl('test') }
property :mirrorlist, String, default: lazy { remi_repo_mirrorlist('test') }
property :description, String, default: lazy { remi_repo_description('test') }
property :gpgkey, String, default: lazy { remi_gpg_key }
property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true

property :debug_baseurl, String, default: lazy { remi_repo_baseurl('debug-test') }
property :debug_description, String, default: lazy { remi_repo_description('debug-test') }
property :debug_enabled, [true, false], default: false

action_class do
  include  YumRemiChef::Cookbook::Helpers
end

action :create do
  yum_remi 'default'

  yum_repository 'remi-test' do
    baseurl new_resource.baseurl
    gpgcheck new_resource.gpgcheck
    enabled new_resource.enabled
    mirrorlist new_resource.mirrorlist
    description new_resource.description
    gpgkey new_resource.gpgkey
  end

  yum_repository 'remi-test-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
  end
end
