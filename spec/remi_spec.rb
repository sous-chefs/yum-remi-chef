# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi' do
  step_into :yum_remi

  %w(8 9 10).each do |version|
    context "on AlmaLinux #{version}" do
      platform 'almalinux', version

      recipe do
        yum_remi 'default'
      end

      it { is_expected.to create_yum_remi_safe('default') }
      it { is_expected.to create_yum_repository('remi') }
      it { is_expected.not_to create_yum_repository('remi-debuginfo') }
    end
  end

  context 'with manage_epel false on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi 'default' do
        manage_epel false
      end
    end

    it { is_expected.to create_yum_remi_safe('default').with(manage_epel: false) }
  end

  context 'with mirror passthrough on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi 'default' do
        mirror_url REMI_MIRRORS
        gpgkey REMI_GPGKEYS
        metadata_expire '6h'
      end
    end

    it do
      is_expected.to create_yum_remi_safe('default').with(
        mirror_url: REMI_MIRRORS,
        gpgkey: REMI_GPGKEYS,
        metadata_expire: '6h'
      )
    end
    it do
      is_expected.to create_yum_repository('remi').with(
        baseurl: %w(
          https://ftp2.osuosl.org/pub/remi/enterprise/9/remi/$basearch/
          https://mirror.usi.edu/pub/remi/enterprise/9/remi/$basearch/
        ),
        gpgkey: REMI_GPGKEYS,
        metadata_expire: '6h'
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi').mirrorlist).to be_nil }
  end

  context 'with default repo settings passed down on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi 'default'
    end

    it { is_expected.to create_yum_remi_safe('default').with(gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021') }
    it { expect(subject.find_resource(:yum_remi_safe, 'default').mirror_url).to be_nil }
    it { expect(subject.find_resource(:yum_remi_safe, 'default').metadata_expire).to be_nil }
  end

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi') }
    it { is_expected.to remove_yum_repository('remi-debuginfo') }
  end
end
