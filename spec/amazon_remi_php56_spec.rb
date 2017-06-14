require 'spec_helper'

describe 'yum-remi-chef::remi-php56' do
  cached(:amazon_remi_php56) do
    ChefSpec::SoloRunner.new(
      platform: 'amazon',
      version: '2016.09'
    ) do |node|
      node.override['yum']['remi-php56']['enabled'] = true
      node.override['yum']['remi-php56']['managed'] = true
      node.override['yum']['remi-php56-debuginfo']['enabled'] = true
      node.override['yum']['remi-php56-debuginfo']['managed'] = true
    end.converge(described_recipe)
  end

  it 'creates yum_repository[remi-safe]' do
    expect(amazon_remi_php56).to create_yum_repository('remi-safe')
  end

  %w(
    remi-php56
    remi-php56-debuginfo
  ).each do |repo|
    it "creates yum_repository[#{repo}]" do
      expect(amazon_remi_php56).to create_yum_repository(repo)
    end
  end
end
