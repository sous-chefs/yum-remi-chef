# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_modular' do
  step_into :yum_remi_modular

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_modular 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
  end

  context 'when removing on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_modular 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('remi-modular') }
    it { is_expected.to remove_yum_repository('remi-modular-debuginfo') }
  end
end
