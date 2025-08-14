# From https://rpms.remirepo.net/ in the "Other Resources" section about
# gpg keys for platform versions.
default['yum-remi-chef']['gpgkey'] =
  case node['platform_family']
  when 'fedora'
    case node['platform_version'].to_i
    when 38, 39
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2023'
    when 40, 41
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024'
    when 42
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2025'
    else
      Chef::Log.fatal("Fedora #{node['platform_version'].to_i} is not currently supported by this cookbook")
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
