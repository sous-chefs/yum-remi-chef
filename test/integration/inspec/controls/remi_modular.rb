control 'remi-modular' do
  title 'verify remi-modular repo was installed'

  describe yum.repo('remi-modular') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'amazon'
                   'http://cdn.remirepo.net/enterprise/7/modular/mirror'
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/modular/#{os.arch}/mirror"

                 else # rhel
                   "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/modular/#{os.arch}/mirror"
                 end
    end
  end

  describe ini('/etc/yum.repos.d/remi-modular.repo') do
    its('remi-modular.gpgcheck') { should cmp 1 }
    its('remi-modular.gpgkey') do
      should cmp case os.name
                 when 'amazon'
                   'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                 when 'fedora'
                   'https://rpms.remirepo.net/RPM-GPG-KEY-remi2022'
                 else # rhel
                   case os.release.to_i
                   when 8
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2018'
                   when 9
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2021'
                   end
                 end
    end
  end
end
