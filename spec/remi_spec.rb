require 'spec_helper'

describe 'yum-remi-chef::remi' do
  step_into :yum_remi

  default_attributes['yum']['remi-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-debuginfo']['managed'] = true

  %w(8 9 10).each do |version|
    context "on AlmaLinux #{version}" do
      platform 'almalinux', version

      it { is_expected.to create_yum_repository('remi') }
      it { is_expected.to_not create_yum_repository('remi-debuginfo') }
    end
  end

  # context 'on Fedora latest' do
  #  platform 'fedora'
  #
  #  it { is_expected.to create_yum_repository('remi') }
  #  it { is_expected.to_not create_yum_repository('remi-debuginfo') }
  # end
end
