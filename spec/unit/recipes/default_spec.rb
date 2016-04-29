require 'spec_helper'

describe 'yum-remi-chef::default' do
  context 'Fedora 20' do
    cached(:fedora_20_default) do
      ChefSpec::ServerRunner.new(
        platform: 'fedora',
        version: '20'
      ).converge(described_recipe)
    end

    %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-php70
      remi-safe
      remi-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(fedora_20_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-php56
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(fedora_20_default).to create_yum_repository(repo)
      end
    end
  end

  context 'Fedora 21' do
    cached(:fedora_21_default) do
      ChefSpec::ServerRunner.new(
        platform: 'fedora',
        version: '21'
      ).converge(described_recipe)
    end

    %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-safe
      remi-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(fedora_21_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-php70
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(fedora_21_default).to create_yum_repository(repo)
      end
    end
  end

  context 'Fedora 22' do
    cached(:fedora_22_default) do
      ChefSpec::ServerRunner.new(
        platform: 'fedora',
        version: '22'
      ).converge(described_recipe)
    end

    %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-safe
      remi-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(fedora_22_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-php70
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(fedora_22_default).to create_yum_repository(repo)
      end
    end
  end

  context 'Fedora 23' do
    cached(:fedora_23_default) do
      ChefSpec::ServerRunner.new(
        platform: 'fedora',
        version: '23'
      ).converge(described_recipe)
    end

    %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-safe
      remi-test-debuginfo
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(fedora_23_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-php70
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(fedora_23_default).to create_yum_repository(repo)
      end
    end
  end

  context 'CentOS 5.11' do
    cached(:centos_511_default) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '5.11'
      ).converge(described_recipe)
    end

    %w(
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-php70
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_511_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-php56
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_511_default).to create_yum_repository(repo)
      end
    end
  end

  context 'CentOS 6.6' do
    cached(:centos_66_default) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.6'
      ).converge(described_recipe)
    end

    %w(
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_66_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-php70
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_66_default).to create_yum_repository(repo)
      end
    end
  end

  context 'CentOS 7.0' do
    cached(:centos_70_default) do
      ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '7.0'
      ).converge(described_recipe)
    end

    %w(
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
    ).each do |repo|
      it "deletes yum_repository[#{repo}]" do
        expect(centos_70_default).to delete_yum_repository("yum-remi-default-delete-#{repo}")
      end
    end

    %w(
      remi
      remi-safe
      remi-php70
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(centos_70_default).to create_yum_repository(repo)
      end
    end
  end
end
