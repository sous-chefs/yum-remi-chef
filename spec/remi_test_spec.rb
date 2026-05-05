# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_test' do
  step_into :yum_remi_test

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_test 'default' do
        debug_enabled true
      end
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-test') }
    it { is_expected.to create_yum_repository('remi-test-debuginfo') }
  end

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_test 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi-test') }
    it { is_expected.to remove_yum_repository('remi-test-debuginfo') }
  end
end
