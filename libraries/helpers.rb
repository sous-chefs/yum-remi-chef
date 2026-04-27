# frozen_string_literal: true

module YumRemiChef
  module Cookbook
    module Helpers
      SUPPORTED_FEDORA_VERSIONS = (42..44).freeze
      SUPPORTED_RHEL_VERSIONS = (8..10).freeze

      def validate_remi_platform!
        return if supported_remi_platform?

        raise "#{node['platform']} #{node['platform_version']} is not supported by yum-remi-chef"
      end

      def validate_php_module_support!(stream_version)
        return if supported_php_module_streams.include?(stream_version)

        raise "`php:remi-#{stream_version}` is not available for #{node['platform']} #{node['platform_version'].to_i}"
      end

      def supported_remi_platform?
        (platform_family?('rhel') && SUPPORTED_RHEL_VERSIONS.cover?(node['platform_version'].to_i)) ||
          (platform_family?('fedora') && SUPPORTED_FEDORA_VERSIONS.cover?(node['platform_version'].to_i))
      end

      def remi_gpg_key
        case node['platform_family']
        when 'fedora'
          case node['platform_version'].to_i
          when 38, 39
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2023'
          when 40, 41
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024'
          when 42, 43
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2025'
          when 44
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2026'
          end
        when 'rhel'
          case node['platform_version'].to_i
          when 8
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
          when 9
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
          when 10
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024'
          end
        end
      end

      def remi_repo_baseurl(repo_slug)
        validate_remi_platform!

        case node['platform_family']
        when 'fedora'
          "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        when 'rhel'
          "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        end
      end

      def remi_repo_mirrorlist(repo_slug)
        validate_remi_platform!

        case node['platform_family']
        when 'fedora'
          "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
        when 'rhel'
          "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
        end
      end

      def remi_repo_description(repo_slug)
        validate_remi_platform!

        case node['platform_family']
        when 'fedora'
          "Remi's #{repo_slug} repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
        when 'rhel'
          "Remi's #{repo_slug} repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
        end
      end

      def supported_php_module_streams
        case node['platform_family']
        when 'fedora'
          %w(7.4 8.0 8.1 8.2 8.3 8.4 8.5)
        when 'rhel'
          case node['platform_version'].to_i
          when 8
            %w(7.2 7.3 7.4 8.0 8.1 8.2 8.3 8.4 8.5)
          when 9, 10
            %w(7.4 8.0 8.1 8.2 8.3 8.4 8.5)
          else
            []
          end
        else
          []
        end
      end
    end
  end
end
