control 'remi-test' do
  title 'verify remi-test repo was installed'

  describe yum.repo('remi-test') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/test/#{os.arch}/mirror"
                 else # rhel
                   if os.release.to_i == 7
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/test/mirror"
                   else
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/test/#{os.arch}/mirror"
                   end
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi-test.repo') do
    its('remi-test.gpgcheck') { should cmp 1 }
    its('remi-test.gpgkey') do
      should cmp case os.name
                 when 'fedora'
                   'https://rpms.remirepo.net/RPM-GPG-KEY-remi2023'
                 else # rhel
                   case os.release.to_i
                   when 7
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                   when 8
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
                   when 9
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
                   end
                 end
    end
  end
end
