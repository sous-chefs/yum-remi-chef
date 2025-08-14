require 'spec_helper'

describe 'yum-remi-chef::remi-php74' do
  step_into :yum_remi_php74
  step_into :yum_remi_modular
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php74']['enabled'] = true
  default_attributes['yum']['remi-php74']['managed'] = true
  default_attributes['yum']['remi-php74-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php74-debuginfo']['managed'] = true

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.4') }
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.4') }
  end

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.4') }
  end
end
