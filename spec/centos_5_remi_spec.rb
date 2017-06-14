require 'spec_helper'

describe 'yum-remi-chef::remi' do
  cached(:centos_5_remi) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '5.11'
    ) do |node|
      node.override['yum']['remi']['enabled'] = true
      node.override['yum']['remi']['managed'] = true
      node.override['yum']['remi-debuginfo']['enabled'] = true
      node.override['yum']['remi-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  %w(
    remi
    remi-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_5_remi).to create_yum_repository(repo)
    end
  end
end
