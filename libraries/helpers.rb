module YumRemiChef
  module Cookbook
    module Helpers
      def rhel_8_or_fedora?
        (platform_family?('rhel') && node['platform_version'].to_i >= 8) || platform_family?('fedora')
      end

      def rhel_7?
        (platform_family?('rhel') && node['platform_version'].to_i == 7)
      end

      def remi_gpg_key
        case node['platform_family']
        when 'fedora'
          case node['platform_version'].to_i
          when 32, 33
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2020'
          when 34, 35
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
          when 36, 37
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2022'
          when 38 # future proofing
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2023'
          end
        when 'rhel'
          case node['platform_version'].to_i
          when 7
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
          when 8
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
          when 9
            'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
          end
        end
      end

      def remi_repo_baseurl(repo_slug)
        case node['platform_family']
        when 'fedora'
          "http://rpms.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        when 'rhel'
          "http://rpms.remirepo.net/enterprise/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/"
        end
      end

      def remi_repo_mirrorlist(repo_slug)
        case node['platform_family']
        when 'fedora'
          "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/#{repo_slug}/$basearch/mirror"
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
        when 'rhel'
          "Remi's #{repo_slug} repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
        end
      end
    end
  end
end

Chef::Resource.include ::YumRemiChef::Cookbook::Helpers
