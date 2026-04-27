control 'remi' do
  title 'verify remi repo was installed'

  describe yum.repo('remi') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/remi/#{os.arch}/mirror"
                 else
                   "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/remi/#{os.arch}/mirror"
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi.repo') do
    its('remi.gpgcheck') { should cmp 1 }
    its('remi.gpgkey') do
      should cmp case os.name
                 when 'fedora'
                   case os.release.to_i
                   when 42, 43
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2025'
                   when 44
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2026'
                   end
                 else
                   case os.release.to_i
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
