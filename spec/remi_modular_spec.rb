require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-modular' do
  default_attributes['yum']['remi-modular']['enabled'] = true
  default_attributes['yum']['remi-modular']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it do
      expect { chef_run }.to raise_error '`remi-modular` is not available for amazon 2'
    end
  end

  context 'on CentOS 7' do
    platform 'centos', '7'

    it do
      expect { chef_run }.to raise_error '`remi-modular` is not available for centos 7'
    end
  end

  context 'on CentOS 8' do
    platform 'centos', '8'

    it do
      is_expected.to create_yum_repository('remi-modular').with(
        mirrorlist: 'http://cdn.remirepo.net/enterprise/8/modular/$basearch/mirror',
        gpgkey: 'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018',
        enabled: true
      )
    end
  end

  context 'on Debian' do
    platform 'debian'

    it do
      expect { chef_run }.to_not raise_error
    end
  end
end
