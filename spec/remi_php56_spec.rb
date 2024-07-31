require 'spec_helper'

describe 'yum-remi-chef::remi-php56' do
  step_into :yum_remi_php56
  step_into :yum_remi_safe
  step_into :yum_remi

  default_attributes['yum']['remi-php56']['enabled'] = true
  default_attributes['yum']['remi-php56']['managed'] = true
  default_attributes['yum']['remi-php56-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php56-debuginfo']['managed'] = true

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-php56') }
    it { is_expected.to create_yum_repository('remi-php56-debuginfo') }
  end

  # context 'on AlmaLinux 8' do
  #   platform 'almalinux', '8'

  #   it do
  #     expect { chef_run }.to raise_error /`remi-php56` is not available for almalinux 8/
  #   end
  # end

  # context 'on AlmaLinux 9' do
  #   platform 'almalinux', '9'

  #   it do
  #     expect { chef_run }.to raise_error /`remi-php56` is not available for almalinux 9/
  #   end
  # end
end
