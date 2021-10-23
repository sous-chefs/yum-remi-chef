# From https://rpms.remirepo.net/ in the "Other Resources" section about
# gpg keys for platform versions.
default['yum-remi-chef']['gpgkey'] = case node['platform_family']
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
                                     else
                                       raise "platform #{node['platform']} not recognised"
                                     end
