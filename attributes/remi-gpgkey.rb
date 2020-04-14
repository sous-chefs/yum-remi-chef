# From https://rpms.remirepo.net/ in the "Other Resources" section about
# gpg keys for platform versions.
default['yum-remi-chef']['gpgkey'] = if platform?('fedora') &&
                                        node['platform_version'].to_i >= 28
                                       'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
                                     elsif platform?('fedora') &&
                                           node['platform_version'].to_i.between?(26, 27)
                                       'https://rpms.remirepo.net/RPM-GPG-KEY-remi2017'
                                     else
                                       'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                                     end
