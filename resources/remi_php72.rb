# frozen_string_literal: true

provides :yum_remi_php72
unified_mode true

property :manage_epel, [true, false], default: true

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  validate_php_module_support!('7.2')

  yum_remi 'default' do
    manage_epel new_resource.manage_epel
  end

  yum_remi_modular 'default' do
    manage_epel new_resource.manage_epel
  end

  dnf_module 'php:remi-7.2'
end

action :remove do
  validate_php_module_support!('7.2')

  dnf_module 'php:remi-7.2' do
    action :reset
  end
end
