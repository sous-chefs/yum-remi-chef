require 'spec_helper'

describe 'yum-remi-chef::remi-test' do
  step_into :yum_remi_test

  default_attributes['yum']['remi-test']['enabled'] = true
  default_attributes['yum']['remi-test']['managed'] = true
  default_attributes['yum']['remi-test-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-test-debuginfo']['managed'] = true

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-test') }
    it { is_expected.to create_yum_repository('remi-test-debuginfo') }
  end

  %w(8 9).each do |version|
    context "on AlmaLinux #{version}" do
      platform 'almalinux', version

      it { is_expected.to create_yum_repository('remi-test') }
      it { is_expected.to create_yum_repository('remi-test-debuginfo') }
    end
  end

  context 'on Fedora latest' do
    platform 'fedora'

    it { is_expected.to create_yum_repository('remi-test') }
    it { is_expected.to create_yum_repository('remi-test-debuginfo') }
  end
end
