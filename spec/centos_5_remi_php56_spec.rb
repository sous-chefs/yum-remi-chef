require 'spec_helper'

describe 'yum-remi-chef::remi-php56' do
  cached(:centos_5_remi_php56) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '5.11'
    ) do |node|
      node.normal['yum']['remi-php56']['enabled'] = true
      node.normal['yum']['remi-php56']['managed'] = true
      node.normal['yum']['remi-php56-debuginfo']['enabled'] = true
      node.normal['yum']['remi-php56-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi]' do
    expect(centos_5_remi_php56).to create_yum_repository('remi')
  end

  %w(
    remi-php56
    remi-php56-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_5_remi_php56).to create_yum_repository(repo)
    end
  end
end
