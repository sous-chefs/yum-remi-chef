# frozen_string_literal: true

provides :yum_remi_safe
unified_mode true

use '_partials/_common'
use '_partials/_passthrough'

property :baseurl, [String, Array], default: lazy { remi_repo_baseurl('safe', mirror_url) }
property :mirrorlist, [String, nil], default: lazy { remi_repo_mirrorlist('safe') unless mirror_url }
property :description, String, default: lazy { remi_repo_description('safe') }

# Remi publishes no debug-safe tree; its own remi-safe.repo points debuginfo at debug-remi.
property :debug_baseurl, [String, Array], default: lazy { remi_repo_baseurl('debug-remi', mirror_url) }
property :debug_description, String, default: lazy { remi_repo_description('debug-safe') }

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  validate_remi_platform!

  yum_epel 'default' do
    only_if { new_resource.manage_epel }
  end

  yum_repository 'remi-safe' do
    baseurl new_resource.baseurl
    mirrorlist new_resource.mirrorlist if new_resource.mirrorlist
    description new_resource.description
    enabled new_resource.enabled
    gpgcheck new_resource.gpgcheck
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end

  yum_repository 'remi-safe-debuginfo' do
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

  yum_repository 'remi-safe-debuginfo' do
    action :remove
  end

  yum_repository 'remi-safe' do
    action :remove
  end
end
