require 'spec_helper'

describe 'yum-remi-chef::remi-php73' do
  step_into :yum_remi_php73
  step_into :yum_remi_modular
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php73']['enabled'] = true
  default_attributes['yum']['remi-php73']['managed'] = true
  default_attributes['yum']['remi-php73-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php73-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php73') }
    it { is_expected.to create_yum_repository('remi-php73-debuginfo') }
  end

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php73') }
    it { is_expected.to create_yum_repository('remi-php73-debuginfo') }
  end

  context 'on CentOS 8' do
    platform 'centos', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }

    it { is_expected.to switch_to_dnf_module('php:remi-7.3') }
  end
end
