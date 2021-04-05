require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-php56' do
  default_attributes['yum']['remi-php56']['enabled'] = true
  default_attributes['yum']['remi-php56']['managed'] = true
  default_attributes['yum']['remi-php56-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php56-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    include_examples 'create remi-safe repo'

    include_examples 'create PHP 5.6 repos'
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      include_examples 'create remi-safe repo'

      include_examples 'create PHP 5.6 repos'
    end
  end
end
