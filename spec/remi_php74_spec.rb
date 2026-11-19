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

  context 'with manage_epel false on AlmaLinux 8' do
    platform 'almalinux', '8'

    recipe do
      yum_remi_php74 'default' do
        manage_epel false
      end
    end

    it { is_expected.to create_yum_remi('default').with(manage_epel: false) }
    it { is_expected.to create_yum_remi_modular('default').with(manage_epel: false) }
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

  context 'with mirror passthrough on AlmaLinux 8' do
    platform 'almalinux', '8'
    cached(:subject) { chef_run }

    recipe do
      yum_remi_php74 'default' do
        mirror_url REMI_MIRRORS
        gpgkey REMI_GPGKEYS
        metadata_expire '6h'
      end
    end

    # ChefSpec matchers see only the last declaration, so check every one.
    { yum_remi: 2, yum_remi_modular: 1 }.each do |type, count|
      it "passes the mirror settings to all #{count} #{type} declarations" do
        found = subject.find_resources(type)
        expect(found.size).to eq(count)
        expect(found.map(&:mirror_url)).to all(eq REMI_MIRRORS)
        expect(found.map(&:gpgkey)).to all(eq REMI_GPGKEYS)
        expect(found.map(&:metadata_expire)).to all(eq '6h')
      end
    end
  end
end
