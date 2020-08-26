require 'spec_helper'

describe 'yum-remi-chef::remi-php71' do
  cached(:centos_6_remi_php71) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '6'
    ) do |node|
      node.override['yum']['remi-php71']['enabled'] = true
      node.override['yum']['remi-php71']['managed'] = true
      node.override['yum']['remi-php71-debuginfo']['enabled'] = true
      node.override['yum']['remi-php71-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi-safe]' do
    expect(centos_6_remi_php71).to create_yum_repository('remi-safe')
  end

  %w(
    remi-php71
    remi-php71-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_6_remi_php71).to create_yum_repository(repo)
    end
  end
end
