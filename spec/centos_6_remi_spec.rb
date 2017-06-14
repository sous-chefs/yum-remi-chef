require 'spec_helper'

describe 'yum-remi-chef::remi' do
  cached(:centos_6_remi) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '6.8'
    ) do |node|
      node.normal['yum']['remi']['enabled'] = true
      node.normal['yum']['remi']['managed'] = true
      node.normal['yum']['remi-debuginfo']['enabled'] = true
      node.normal['yum']['remi-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  %w(
    remi
    remi-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_6_remi).to create_yum_repository(repo)
    end
  end
end
