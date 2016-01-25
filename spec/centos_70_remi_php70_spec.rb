require 'spec_helper'

describe 'yum-remi-chef::remi-php70' do
  cached(:centos_70_remi_php70) do
    ChefSpec::ServerRunner.new(
      platform: 'centos',
      version: '7.0'
    ) do |node|
      node.set['yum']['remi-php70']['enabled'] = true
      node.set['yum']['remi-php70']['managed'] = true
      node.set['yum']['remi-php70-debuginfo']['enabled'] = true
      node.set['yum']['remi-php70-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi]' do
    expect(centos_70_remi_php70).to create_yum_repository('remi')
  end

  %w(
    remi-php70
    remi-php70-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(centos_70_remi_php70).to create_yum_repository(repo)
    end
  end
end
