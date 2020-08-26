require 'spec_helper'

describe 'yum-remi-chef::remi-php73' do
  cached(:centos_6_remi_php73) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '6'
    ) do |node|
      node.override['yum']['remi-php73']['enabled'] = true
      node.override['yum']['remi-php73']['managed'] = true
      node.override['yum']['remi-php73-debuginfo']['enabled'] = true
      node.override['yum']['remi-php73-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi-safe]' do
    expect(centos_6_remi_php73).to create_yum_repository('remi-safe')
  end

  %w(
    remi-php73
    remi-php73-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_6_remi_php73).to create_yum_repository(repo)
    end
  end
end
