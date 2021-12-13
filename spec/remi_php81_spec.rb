require 'spec_helper'

describe 'yum-remi-chef::remi-php81' do
  default_attributes['yum']['remi-php81']['enabled'] = true
  default_attributes['yum']['remi-php81']['managed'] = true
  default_attributes['yum']['remi-php81-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php81-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php81') }
    it { is_expected.to create_yum_repository('remi-php81-debuginfo') }
  end

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }

    it { is_expected.to create_yum_repository('remi-php81') }
    it { is_expected.to create_yum_repository('remi-php81-debuginfo') }
  end

  context 'on CentOS 8' do
    platform 'centos', '8'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-modular') }

    it { is_expected.to switch_to_dnf_module('php:remi-8.1') }
  end

  context 'on Debian' do
    platform 'debian'

    it do
      expect { chef_run }.to_not raise_error
    end
  end
end
