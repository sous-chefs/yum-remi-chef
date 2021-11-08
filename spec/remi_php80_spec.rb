require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-php80' do
  default_attributes['yum']['remi-php80']['enabled'] = true
  default_attributes['yum']['remi-php80']['managed'] = true
  default_attributes['yum']['remi-php80-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php80-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it_behaves_like 'create remi-safe repo'

    it_behaves_like 'create PHP 8.0 repos'
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      it_behaves_like 'create remi-safe repo'

      it_behaves_like 'create PHP 8.0 repos'
    end
  end

  context 'on Debian' do
    platform 'debian'

    it do
      expect { chef_run }.to_not raise_error
    end
  end
end
