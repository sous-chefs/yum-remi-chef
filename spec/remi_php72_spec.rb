# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_php72' do
  step_into :yum_remi_php72
  step_into :yum_remi_modular

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    recipe do
      yum_remi_php72 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.2') }
  end

  context 'on AlmaLinux 9' do
    platform 'almalinux', '9'

    recipe do
      yum_remi_php72 'default'
    end

    it 'raises for an unsupported stream' do
      expect { chef_run }.to raise_error(RuntimeError, /php:remi-7\.2/)
    end
  end
end
