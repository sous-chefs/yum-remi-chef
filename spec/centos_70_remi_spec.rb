require 'spec_helper'

describe 'yum-remi::remi' do
  cached(:centos_70_remi) do
    ChefSpec::ServerRunner.new(
      platform: 'centos',
      version: '7.0'
      ) do |node|
      node.set['yum']['remi']['enabled'] = true
      node.set['yum']['remi']['managed'] = true
      node.set['yum']['remi-debuginfo']['enabled'] = true
      node.set['yum']['remi-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  %w(
    remi
    remi-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_70_remi).to create_yum_repository(repo)
    end
  end
end
