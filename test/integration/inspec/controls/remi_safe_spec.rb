control 'remi-safe' do
  title 'verify remi-safe repo was installed'

  only_if 'not supported on fedora' do
    os.name != 'fedora'
  end

  describe yum.repo('remi-safe') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.release.to_i
                 when 7
                   "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/safe/mirror"
                 else
                   "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/safe/#{os.arch}/mirror"
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi-safe.repo') do
    its('remi-safe.gpgcheck') { should cmp 1 }
    its('remi-safe.gpgkey') do
      should cmp case os.name
                 when 'fedora'
                   case os.release.to_i
                   when 40, 41
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024'
                   when 42
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2025'
                   end
                 else # rhel
                   case os.release.to_i
                   when 7
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                   when 8
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
                   when 9
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
                   when 10
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2024'
                   end
                 end
    end
  end
end
