require 'spec_helper'

describe 'yum-remi-chef::remi-php56' do
  cached(:centos_7_remi_php56) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7'
    ) do |node|
      node.override['yum']['remi-php56']['enabled'] = true
      node.override['yum']['remi-php56']['managed'] = true
      node.override['yum']['remi-php56-debuginfo']['enabled'] = true
      node.override['yum']['remi-php56-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi-safe]' do
    expect(centos_7_remi_php56).to create_yum_repository('remi-safe')
  end

  %w(
    remi-php56
    remi-php56-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_7_remi_php56).to create_yum_repository(repo)
    end
  end
end
