# frozen_string_literal: true

provides :yum_remi_php81
unified_mode true

use '_partials/_passthrough'

property :manage_epel, [true, false], default: true

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  validate_php_module_support!('8.1')

  yum_remi 'default' do
    manage_epel new_resource.manage_epel
    mirror_url new_resource.mirror_url if new_resource.mirror_url
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end

  yum_remi_modular 'default' do
    manage_epel new_resource.manage_epel
    mirror_url new_resource.mirror_url if new_resource.mirror_url
    gpgkey new_resource.gpgkey
    metadata_expire new_resource.metadata_expire if new_resource.metadata_expire
  end

  dnf_module 'php:remi-8.1'
end

action :remove do
  validate_php_module_support!('8.1')

  dnf_module 'php:remi-8.1' do
    action :reset
  end
end
