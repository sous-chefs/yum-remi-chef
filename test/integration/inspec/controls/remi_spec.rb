control 'remi' do
  describe yum.repo('remi') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "#{
      case os.name
      when 'fedora'
        "http://cdn.remirepo.net/fedora/#{os.release.to_i}/remi/mirror"
      when 'amazon'
        'http://cdn.remirepo.net/enterprise/7/remi/mirror'
      else
        "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/remi/mirror"
      end
    }"
    end
  end

  describe ini('/etc/yum.repos.d/remi.repo') do
    its('remi.gpgcheck') { should cmp 1 }
    its('remi.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
  end
end
