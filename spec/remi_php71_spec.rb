require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-php71' do
  default_attributes['yum']['remi-php71']['enabled'] = true
  default_attributes['yum']['remi-php71']['managed'] = true
  default_attributes['yum']['remi-php71-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php71-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    include_examples 'create remi-safe repo'

    include_examples 'create PHP 7.1 repos'
  end

  context 'on CentOS 7' do
    platform 'centos', '7'

    include_examples 'create remi-safe repo'
    include_examples 'create PHP 7.1 repos'
  end

  context 'on CentOS 8' do
    platform 'centos', '8'

    it do
      expect { chef_run }.to raise_error '`remi-php71` is not available for centos 8'
    end
  end

  context 'on Debian' do
    platform 'debian'

    it do
      expect { chef_run }.to_not raise_error
    end
  end
end
