# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_php74' do
  step_into :yum_remi_php74
  step_into :yum_remi_modular

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    recipe do
      yum_remi_php74 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.4') }
  end

  context 'when removing on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_php74 'default' do
        action :remove
      end
    end

    it { is_expected.to reset_dnf_module('php:remi-7.4') }
  end
end
