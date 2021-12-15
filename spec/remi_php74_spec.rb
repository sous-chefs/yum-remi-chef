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

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php74') }
    it { is_expected.to create_yum_repository('remi-php74-debuginfo') }
  end

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php74') }
    it { is_expected.to create_yum_repository('remi-php74-debuginfo') }
  end

  context 'on CentOS 8' do
    platform 'centos', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }

    it { is_expected.to switch_to_dnf_module('php:remi-7.4') }
  end
end
