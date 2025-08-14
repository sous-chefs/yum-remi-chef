require 'spec_helper'

describe 'yum-remi-chef::remi-php83' do
  step_into :yum_remi_php83
  step_into :yum_remi_modular
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php83']['enabled'] = true
  default_attributes['yum']['remi-php83']['managed'] = true
  default_attributes['yum']['remi-php83-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php83-debuginfo']['managed'] = true

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.3') }
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.3') }
  end

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.3') }
  end
end
