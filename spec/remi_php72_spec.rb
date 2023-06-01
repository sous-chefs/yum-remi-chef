require 'spec_helper'

describe 'yum-remi-chef::remi-php72' do
  step_into :yum_remi_php72
  step_into :yum_remi_modular
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php72']['enabled'] = true
  default_attributes['yum']['remi-php72']['managed'] = true
  default_attributes['yum']['remi-php72-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php72-debuginfo']['managed'] = true

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-php72') }
    it { is_expected.to create_yum_repository('remi-php72-debuginfo') }
  end

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.2') }
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.2') }
  end
end
