# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_safe' do
  step_into :yum_remi_safe

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default'
    end

    it { is_expected.to create_yum_epel('default') }
    it { is_expected.to create_yum_repository('remi-safe') }
  end

  context 'without EPEL on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        debug_enabled true
        manage_epel false
      end
    end

    it { is_expected.to_not create_yum_epel('default') }
    it { is_expected.to create_yum_repository('remi-safe') }
    it do
      is_expected.to create_yum_repository('remi-safe-debuginfo').with(
        baseurl: 'http://rpms.remirepo.net/enterprise/9/debug-remi/$basearch/'
      )
    end
  end

  context 'with default repo settings on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_safe 'default'
    end

    it do
      is_expected.to create_yum_repository('remi-safe').with(
        baseurl: 'http://rpms.remirepo.net/enterprise/9/safe/$basearch/',
        mirrorlist: 'http://cdn.remirepo.net/enterprise/9/safe/$basearch/mirror',
        gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi-safe').metadata_expire).to be_nil }
  end

  context 'with a mirror_url String on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_safe 'default' do
        mirror_url 'https://mirror.pit.teraswitch.com/remi/'
        metadata_expire '6h'
        debug_enabled true
      end
    end

    it do
      is_expected.to create_yum_repository('remi-safe').with(
        baseurl: 'https://mirror.pit.teraswitch.com/remi/enterprise/9/safe/$basearch/',
        metadata_expire: '6h'
      )
    end
    it do
      is_expected.to create_yum_repository('remi-safe-debuginfo').with(
        baseurl: 'https://mirror.pit.teraswitch.com/remi/enterprise/9/debug-remi/$basearch/',
        metadata_expire: '6h'
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi-safe').mirrorlist).to be_nil }
  end

  context 'with a mirror_url Array and gpgkey Array on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_safe 'default' do
        mirror_url REMI_MIRRORS
        gpgkey REMI_GPGKEYS
      end
    end

    it do
      is_expected.to create_yum_repository('remi-safe').with(
        baseurl: %w(
          https://mirror.usi.edu/pub/remi/enterprise/9/safe/$basearch/
          https://mirror.pit.teraswitch.com/remi/enterprise/9/safe/$basearch/
        ),
        gpgkey: REMI_GPGKEYS
      )
    end
    it { expect(subject.find_resource(:yum_repository, 'remi-safe').mirrorlist).to be_nil }
  end

  context 'with mirror_url and an explicit baseurl on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_safe 'default' do
        mirror_url REMI_MIRRORS
        baseurl 'https://example.org/remi/safe/$basearch/'
      end
    end

    it { is_expected.to create_yum_repository('remi-safe').with(baseurl: 'https://example.org/remi/safe/$basearch/') }
    it { expect(subject.find_resource(:yum_repository, 'remi-safe').mirrorlist).to be_nil }
  end

  context 'with mirrorlist nil on AlmaLinux 9' do
    platform 'almalinux', '9'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_safe 'default' do
        mirrorlist nil
      end
    end

    it { is_expected.to create_yum_repository('remi-safe').with(baseurl: 'http://rpms.remirepo.net/enterprise/9/safe/$basearch/') }
    it { expect(subject.find_resource(:yum_repository, 'remi-safe').mirrorlist).to be_nil }
  end

  context 'with a mirror_url that is not a URL on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        mirror_url 'mirror.usi.edu'
      end
    end

    it { expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /mirror_url/) }
  end

  context 'with an empty mirror_url on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        mirror_url []
      end
    end

    it { expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /mirror_url/) }
  end

  context 'with an invalid metadata_expire on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        metadata_expire '6 hours'
      end
    end

    it { expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /metadata_expire/) }
  end

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi-safe') }
    it { is_expected.to remove_yum_repository('remi-safe-debuginfo') }
  end
end
