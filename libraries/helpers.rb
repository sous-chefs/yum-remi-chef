# frozen_string_literal: true

module YumRemiChef
  module Cookbook
    module Helpers
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
        platform_family?('rhel') && SUPPORTED_RHEL_VERSIONS.cover?(node['platform_version'].to_i)
      end

      def remi_gpg_key
        if platform_family?('rhel')
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

        "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
      end

      def remi_repo_mirrorlist(repo_slug)
        validate_remi_platform!

        "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
      end

      def remi_repo_description(repo_slug)
        validate_remi_platform!

        "Remi's #{repo_slug} repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
      end

      def supported_php_module_streams
        if platform_family?('rhel')
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
