# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_test' do
  step_into :yum_remi_test

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_test 'default' do
        debug_enabled true
      end
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-test') }
    it { is_expected.to create_yum_repository('remi-test-debuginfo') }
  end

  context 'with manage_epel false on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_test 'default' do
        manage_epel false
      end
    end

    it { is_expected.to create_yum_remi('default').with(manage_epel: false) }
  end

  context 'with mirror passthrough on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_test 'default' do
        mirror_url REMI_MIRRORS
        gpgkey REMI_GPGKEYS
        metadata_expire '6h'
      end
    end

    it do
      is_expected.to create_yum_remi('default').with(
        mirror_url: REMI_MIRRORS,
        gpgkey: REMI_GPGKEYS,
        metadata_expire: '6h'
      )
    end
    it do
      is_expected.to create_yum_repository('remi-test').with(
        baseurl: %w(
          https://mirror.usi.edu/pub/remi/enterprise/9/test/$basearch/
          https://mirror.pit.teraswitch.com/remi/enterprise/9/test/$basearch/
        ),
        gpgkey: REMI_GPGKEYS,
        metadata_expire: '6h'
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi-test').mirrorlist).to be_nil }
  end

  context 'with default repo settings passed down on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_test 'default'
    end

    it { is_expected.to create_yum_remi('default').with(gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021') }
    it { expect(subject.find_resource(:yum_remi, 'default').mirror_url).to be_nil }
    it { expect(subject.find_resource(:yum_remi, 'default').metadata_expire).to be_nil }
  end

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_test 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi-test') }
    it { is_expected.to remove_yum_repository('remi-test-debuginfo') }
  end
end
