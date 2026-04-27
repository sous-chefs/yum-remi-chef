# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi' do
  step_into :yum_remi

  %w(8 9 10).each do |version|
    context "on AlmaLinux #{version}" do
      platform 'almalinux', version

      recipe do
        yum_remi 'default'
      end

      it { is_expected.to create_yum_remi_safe('default') }
      it { is_expected.to create_yum_repository('remi') }
      it { is_expected.not_to create_yum_repository('remi-debuginfo') }
    end
  end
end
