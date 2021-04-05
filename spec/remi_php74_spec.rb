require 'spec_helper'
require 'shared_examples'

describe 'yum-remi-chef::remi-php74' do
  default_attributes['yum']['remi-php74']['enabled'] = true
  default_attributes['yum']['remi-php74']['managed'] = true
  default_attributes['yum']['remi-php74-debuginfo']['enabled'] = true
  default_attributes['yum']['remi-php74-debuginfo']['managed'] = true

  context 'on Amazon Linux 2' do
    platform 'amazon', '2'

    it_behaves_like 'create remi-safe repo'

    it_behaves_like 'create PHP 7.4 repos'
  end

  %w(7 8).each do |version|
    context "on CentOS #{version}" do
      platform 'centos', version

      it_behaves_like 'create remi-safe repo'

      it_behaves_like 'create PHP 7.4 repos'
    end
  end
end
