# frozen_string_literal: true

provides :yum_remi_php80
unified_mode true

action_class do
  include YumRemiChef::Cookbook::Helpers
end

action :create do
  validate_php_module_support!('8.0')

  yum_remi 'default'

  yum_remi_modular 'default'

  dnf_module 'php:remi-8.0'
end
