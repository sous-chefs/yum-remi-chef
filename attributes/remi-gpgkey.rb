# From https://rpms.remirepo.net/ in the "Other Resources" section about
# gpg keys for platform versions.
default['yum-remi-chef']['gpgkey'] =
  case node['platform_family']
  when 'fedora'
    case node['platform_version'].to_i
    when 32, 33
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2020'
    when 34, 35
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
    when 36, 37
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2022'
    when 38
      'https://rpms.remirepo.net/RPM-GPG-KEY-remi2023'
    else
      Chef::Log.fatal("Fedora #{node['platform_version'].to_i} is not currently supported by this cookbook")
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
