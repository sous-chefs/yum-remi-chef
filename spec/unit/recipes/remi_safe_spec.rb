require 'spec_helper'

describe 'yum-remi-chef::remi-safe' do
  context 'CentOS 5.11' do
    cached(:centos_511_remi_safe) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '5.11'
      ) do |node|
        node.set['yum']['remi-safe']['enabled'] = true
        node.set['yum']['remi-safe']['managed'] = true
      end.converge(described_recipe)
    end

    it 'creates yum_repository[remi-safe]' do
      expect(centos_511_remi_safe).to create_yum_repository('remi-safe')
    end
  end

  context 'CentOS 6.6' do
    cached(:centos_66_remi_safe) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.6'
      ) do |node|
        node.set['yum']['remi-safe']['enabled'] = true
        node.set['yum']['remi-safe']['managed'] = true
      end.converge(described_recipe)
    end

    it 'creates yum_repository[remi-safe]' do
      expect(centos_66_remi_safe).to create_yum_repository('remi-safe')
    end
  end

  context 'CentOS 7.0' do
    cached(:centos_70_remi_safe) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '7.0'
      ) do |node|
        node.set['yum']['remi-safe']['enabled'] = true
        node.set['yum']['remi-safe']['managed'] = true
      end.converge(described_recipe)
    end

    it 'creates yum_repository[remi-safe]' do
      expect(centos_70_remi_safe).to create_yum_repository('remi-safe')
    end
  end
end
