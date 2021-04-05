require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi' do
  default_attributes['yum']['remi-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    include_examples 'create remi repos'
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      include_examples 'create remi repos'
    end
  end

  context 'on Fedora latest' do
    platform 'fedora'

    include_examples 'create remi repos'
  end
end
