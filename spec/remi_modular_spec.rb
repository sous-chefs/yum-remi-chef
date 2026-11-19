# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_modular' do
  step_into :yum_remi_modular

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_modular 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
  end

  context 'with manage_epel false on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_modular 'default' do
        manage_epel false
      end
    end

    it { is_expected.to create_yum_remi('default').with(manage_epel: false) }
  end

  context 'with mirror passthrough on AlmaLinux 10' do
    platform 'almalinux', '10'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_modular 'default' do
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
      is_expected.to create_yum_repository('remi-modular').with(
        baseurl: %w(
          https://ftp2.osuosl.org/pub/remi/enterprise/10/modular/$basearch/
          https://mirror.usi.edu/pub/remi/enterprise/10/modular/$basearch/
        ),
        gpgkey: REMI_GPGKEYS,
        metadata_expire: '6h'
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi-modular').mirrorlist).to be_nil }
  end

  context 'with default repo settings passed down on AlmaLinux 10' do
    platform 'almalinux', '10'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_modular 'default'
    end

    it { is_expected.to create_yum_remi('default').with(gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024') }
    it { expect(subject.find_resource(:yum_remi, 'default').mirror_url).to be_nil }
    it { expect(subject.find_resource(:yum_remi, 'default').metadata_expire).to be_nil }
  end

  context 'when removing on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_modular 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi-modular') }
    it { is_expected.to remove_yum_repository('remi-modular-debuginfo') }
  end
end
