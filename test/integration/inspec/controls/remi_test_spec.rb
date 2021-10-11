control 'remi-test' do
  describe yum.repo('remi-test') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/test/$basearch/mirror"
                 when 'amazon'
                   'http://cdn.remirepo.net/enterprise/7/test/mirror'
                 else # rhel
                   if os.release.to_i == 7
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/test/mirror"
                   else
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/test/$basearch/mirror"
                   end
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi-test.repo') do
    its('remi-test.gpgcheck') { should cmp 1 }
    its('remi-test.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
  end
end
