require 'spec_helper'

describe 'yum-remi-chef::remi-safe' do
  step_into :yum_remi_safe

  default_attributes['yum']['remi-safe-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-safe-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it { is_expected.to create_yum_repository('remi-safe') }
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      it { is_expected.to create_yum_repository('remi-safe') }
    end
  end
end
