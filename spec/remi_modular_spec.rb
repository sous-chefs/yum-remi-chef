require 'spec_helper'

describe 'yum-remi-chef::remi-modular' do
  step_into :yum_remi_modular

  default_attributes['yum']['remi-modular']['enabled'] = true
  default_attributes['yum']['remi-modular']['managed'] = true

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    it do
      is_expected.to create_yum_repository('remi-modular').with(
        mirrorlist: 'http://cdn.remirepo.net/enterprise/8/modular/$basearch/mirror',
        gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018',
        enabled: true
      )
    end
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    it do
      is_expected.to create_yum_repository('remi-modular').with(
        mirrorlist: 'http://cdn.remirepo.net/enterprise/9/modular/$basearch/mirror',
        gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021',
        enabled: true
      )
    end
  end

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    it do
      is_expected.to create_yum_repository('remi-modular').with(
        mirrorlist: 'http://cdn.remirepo.net/enterprise/10/modular/$basearch/mirror',
        gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024',
        enabled: true
      )
    end
  end
end
