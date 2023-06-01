require 'spec_helper'

describe 'yum-remi-chef::remi-php70' do
  step_into :yum_remi_php70
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php70']['enabled'] = true
  default_attributes['yum']['remi-php70']['managed'] = true
  default_attributes['yum']['remi-php70-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php70-debuginfo']['managed'] = true

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-php70') }
    it { is_expected.to create_yum_repository('remi-php70-debuginfo') }
  end

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it do
      expect { chef_run }.to raise_error /`remi-php70` is not available for almalinux 8/
    end
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it do
      expect { chef_run }.to raise_error /`remi-php70` is not available for almalinux 9/
    end
  end
end
