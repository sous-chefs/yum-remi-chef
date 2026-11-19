# frozen_string_literal: true

provides :yum_remi_modular
unified_mode true

use '_partials/_common'
use '_partials/_passthrough'

property :baseurl, [String, Array], default: lazy { remi_repo_baseurl('modular', mirror_url) }
property :mirrorlist, [String, nil], default: lazy { remi_repo_mirrorlist('modular') unless mirror_url }
property :description, String, default: lazy { remi_repo_description('modular') }

property :debug_baseurl, [String, Array], default: lazy { remi_repo_baseurl('debug-modular', mirror_url) }
property :debug_description, String, default: lazy { remi_repo_description('debug-modular') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  validate_remi_platform!

  yum_remi 'default' do
    manage_epel new_resource.manage_epel
    mirror_url new_resource.mirror_url if new_resource.mirror_url
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end

  yum_repository 'remi-modular' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist if new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end

  yum_repository 'remi-modular-debuginfo' do
    baseurl new_resource.debug_baseurl
    description new_resource.debug_description
    enabled new_resource.debug_enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end if new_resource.debug_enabled
end

action :remove do
  validate_remi_platform!

  yum_repository 'remi-modular-debuginfo' do
    action :remove
  end

  yum_repository 'remi-modular' do
    action :remove
  end
end
