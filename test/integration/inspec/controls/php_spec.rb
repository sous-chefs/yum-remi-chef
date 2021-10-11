version = input('version')
shortver = version.delete('.').to_i

control 'php' do
  describe command("php#{shortver} --version") do
    its('stdout') { should match /#{version}/ }
  end

  describe yum.repo("remi-php#{shortver}") do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php#{shortver}/$basearch/mirror"
                 when 'amazon'
                   "http://cdn.remirepo.net/enterprise/7/php#{shortver}/mirror"
                 else # rhel
                   if os.release.to_i == 7
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{shortver}/mirror"
                   else
                     "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{shortver}/$basearch/mirror"
                   end
                 end
    end
  end

  describe ini("/etc/yum.repos.d/remi-php#{shortver}.repo") do
    its("remi-php#{shortver}.gpgcheck") { should cmp 1 }
    its("remi-php#{shortver}.gpgkey") { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
  end
end
