require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-php72' do
  default_attributes['yum']['remi-php72']['enabled'] = true
  default_attributes['yum']['remi-php72']['managed'] = true
  default_attributes['yum']['remi-php72-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php72-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    include_examples 'create remi-safe repo'

    include_examples 'create PHP 7.2 repos'
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      include_examples 'create remi-safe repo'

      include_examples 'create PHP 7.2 repos'
    end
  end

  context 'on Debian' do
    platform 'debian'

    it do
      expect { chef_run }.to_not raise_error
    end
  end
end
