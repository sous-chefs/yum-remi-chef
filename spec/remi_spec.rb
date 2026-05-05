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

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi') }
    it { is_expected.to remove_yum_repository('remi-debuginfo') }
  end
end
