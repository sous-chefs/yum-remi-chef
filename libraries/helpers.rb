module YumRemiChef
  module Cookbook
    module Helpers
      def rhel_8_or_fedora?
        (platform_family?('rhel') && node['platform_version'].to_i >= 8) || platform_family?('fedora')
      end

      def rhel_7_or_amazon?
        (platform_family?('rhel') && node['platform_version'].to_i == 7) || platform_family?('amazon')
      end

      def remi_gpg_key
        case node['platform_family']
        when 'fedora'
          case node['platform_version'].to_i
          when 32, 33
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2020'
          when 34, 35
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
          when 36, 37 # future proofing
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2022'
          end
        when 'amazon'
          # Use CentOS 7 key
          'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
        when 'rhel'
          if node['platform_version'].to_i == 7
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
          else
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
          end
        end
      end

      def remi_repo_baseurl(repo_slug)
        case node['platform_family']
        when 'fedora'
          "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        when 'amazon'
          # Use CentOS 7 repo
          "http://rpms.remirepo.net/enterprise/7/#{repo_slug}/$basearch/"
        when 'rhel'
          "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        end
      end

      def remi_repo_mirrorlist(repo_slug)
        case node['platform_family']
        when 'fedora'
          "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
        when 'amazon'
          # Use CentOS 7 repo
          "http://cdn.remirepo.net/enterprise/7/#{repo_slug}/mirror"
        when 'rhel'
          if node['platform_version'].to_i == 7
            "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/mirror"
          else
            "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
          end
        end
      end

      def remi_repo_description(repo_slug)
        case node['platform_family']
        when 'fedora'
          "Remi's #{repo_slug} repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
        when 'amazon'
          # Use CentOS 7 repo
          "Remi's #{repo_slug} repository for Enterprise Linux 7 - $basearch"
        when 'rhel'
          "Remi's #{repo_slug} repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
        end
      end
    end
  end
end

Chef::Resource.include ::YumRemiChef::Cookbook::Helpers
