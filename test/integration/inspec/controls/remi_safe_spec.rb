control 'remi-safe' do
  title 'verify remi-safe repo was installed'

  only_if 'not supported on fedora' do
    os.name != 'fedora'
  end

  describe yum.repo('remi-safe') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'amazon'
                   'http://cdn.remirepo.net/enterprise/7/safe/mirror'
                 else # rhel
                   if os.release.to_i == 7
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/safe/mirror"
                   else
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/safe/#{os.arch}/mirror"
                   end
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi-safe.repo') do
    its('remi-safe.gpgcheck') { should cmp 1 }
    its('remi-safe.gpgkey') do
      should cmp case os.name
                 when 'amazon'
                   'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                 when 'fedora'
                   'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
                 else # rhel
                   if os.release.to_i == 7
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                   else
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
                   end
                 end
    end
  end
end
