require 'spec_helper'

describe 'yum-remi-chef::remi-test' do
  context 'CentOS 5.11' do
    cached(:centos_511_remi_test) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '5.11'
      ) do |node|
        node.set['yum']['remi-test']['enabled'] = true
        node.set['yum']['remi-test']['managed'] = true
        node.set['yum']['remi-test-debuginfo']['enabled'] = true
        node.set['yum']['remi-test-debuginfo']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      remi-php55
      remi-php55-debuginfo
      remi-php56
      remi-php56-debuginfo
      remi-php70
      remi-php70-debuginfo
      remi-php70-test
      remi-php70-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_511_remi_test).to delete_yum_repository("remi-test-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-test
      remi-test-debuginfo
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_511_remi_test).to create_yum_repository(repo)
      end
    end
  end

  context 'CentOS 6.6' do
    cached(:centos_66_remi_test) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.6'
      ) do |node|
        node.set['yum']['remi-test']['enabled'] = true
        node.set['yum']['remi-test']['managed'] = true
        node.set['yum']['remi-test-debuginfo']['enabled'] = true
        node.set['yum']['remi-test-debuginfo']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      remi-php55
      remi-php55-debuginfo
      remi-php56
      remi-php56-debuginfo
      remi-php70
      remi-php70-debuginfo
      remi-php70-test
      remi-php70-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_66_remi_test).to delete_yum_repository("remi-test-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-test
      remi-test-debuginfo
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_66_remi_test).to create_yum_repository(repo)
      end
    end
  end

  context 'CentOS 7.0' do
    cached(:centos_70_remi_test) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '7.0'
      ) do |node|
        node.set['yum']['remi-test']['enabled'] = true
        node.set['yum']['remi-test']['managed'] = true
        node.set['yum']['remi-test-debuginfo']['enabled'] = true
        node.set['yum']['remi-test-debuginfo']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      remi-php55
      remi-php55-debuginfo
      remi-php56
      remi-php56-debuginfo
      remi-php70
      remi-php70-debuginfo
      remi-php70-test
      remi-php70-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_70_remi_test).to delete_yum_repository("remi-test-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-test
      remi-test-debuginfo
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_70_remi_test).to create_yum_repository(repo)
      end
    end
  end
end
