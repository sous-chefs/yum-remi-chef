require 'spec_helper'

describe 'yum-remi-chef::remi' do
  step_into :yum_remi

  default_attributes['yum']['remi-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it { is_expected.to create_yum_repository('remi') }
    it { is_expected.to create_yum_repository('remi-debuginfo') }
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      it { is_expected.to create_yum_repository('remi') }
      it { is_expected.to create_yum_repository('remi-debuginfo') }
    end
  end

  context 'on Fedora latest' do
    platform 'fedora'

    it { is_expected.to create_yum_repository('remi') }
    it { is_expected.to create_yum_repository('remi-debuginfo') }
  end
end
