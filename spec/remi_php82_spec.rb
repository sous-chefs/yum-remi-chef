require 'spec_helper'

describe 'yum-remi-chef::remi-php82' do
  step_into :yum_remi_php82
  step_into :yum_remi_modular
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php82']['enabled'] = true
  default_attributes['yum']['remi-php82']['managed'] = true
  default_attributes['yum']['remi-php82-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php82-debuginfo']['managed'] = true

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.2') }
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.2') }
  end

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.2') }
  end
end
