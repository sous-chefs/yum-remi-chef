# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_safe' do
  step_into :yum_remi_safe

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_safe 'default' do
        debug_enabled true
        manage_epel false
      end
    end

    it { is_expected.to create_yum_repository('remi-safe') }
    it { is_expected.to create_yum_repository('remi-safe-debuginfo') }
  end
end
