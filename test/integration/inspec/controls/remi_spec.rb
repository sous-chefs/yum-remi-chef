control 'remi' do
  title 'verify remi repo was installed'

  describe yum.repo('remi') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/remi/#{os.arch}/mirror"
                 when 'amazon'
                   'http://cdn.remirepo.net/enterprise/7/remi/mirror'
                 else # rhel
                   if os.release.to_i == 7
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/remi/mirror"
                   else
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/remi/#{os.arch}/mirror"
                   end
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi.repo') do
    its('remi.gpgcheck') { should cmp 1 }
    its('remi.gpgkey') do
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
