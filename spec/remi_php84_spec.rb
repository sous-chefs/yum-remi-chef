# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_php84' do
  step_into :yum_remi_php84
  step_into :yum_remi_modular

  context 'on AlmaLinux 10' do
    platform 'almalinux', '10'

    recipe do
      yum_remi_php84 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-8.4') }
  end
end
