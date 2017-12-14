require 'spec_helper'

describe 'yum-remi-chef::remi-php72' do
  cached(:centos_7_remi_php72) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.3.1611'
    ) do |node|
      node.override['yum']['remi-php72']['enabled'] = true
      node.override['yum']['remi-php72']['managed'] = true
      node.override['yum']['remi-php72-debuginfo']['enabled'] = true
      node.override['yum']['remi-php72-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi-safe]' do
    expect(centos_7_remi_php72).to create_yum_repository('remi-safe')
  end

  %w(
    remi-php72
    remi-php72-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_7_remi_php72).to create_yum_repository(repo)
    end
  end
end
