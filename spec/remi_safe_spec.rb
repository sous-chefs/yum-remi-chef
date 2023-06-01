require 'spec_helper'

describe 'yum-remi-chef::remi-safe' do
  step_into :yum_remi_safe

  default_attributes['yum']['remi-safe-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-safe-debuginfo']['managed'] = true

  context 'on CentOS 7' do
    platform 'centos', '7'

    it { is_expected.to create_yum_repository('remi-safe') }
  end

  %w(8 9).each do |version|
    context "on AlmaLinux #{version}" do
      platform 'almalinux', version

      it { is_expected.to create_yum_repository('remi-safe') }
    end
  end
end
