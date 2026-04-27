# frozen_string_literal: true

require 'spec_helper'

describe 'yum_remi_php73' do
  step_into :yum_remi_php73
  step_into :yum_remi_modular

  context 'on AlmaLinux 8' do
    platform 'almalinux', '8'

    recipe do
      yum_remi_php73 'default'
    end

    it { is_expected.to create_yum_remi('default') }
    it { is_expected.to create_yum_repository('remi-modular') }
    it { is_expected.to switch_to_dnf_module('php:remi-7.3') }
  end

  context 'on Rocky Linux 9' do
    platform 'rocky', '9'

    recipe do
      yum_remi_php73 'default'
    end

    it 'raises for an unsupported stream' do
      expect { chef_run }.to raise_error(RuntimeError, /php:remi-7\.3/)
    end
  end
end
