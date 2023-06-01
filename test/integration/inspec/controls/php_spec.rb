version = input('version')
shortver = version.delete('.').to_i

control 'php' do
  title 'verify correct version of PHP and repo was installed'

  describe command('php --version') do
    its('stdout') { should match /#{version}/ }
  end

  if os.redhat? && os.release.to_i == 7
    describe yum.repo("remi-php#{shortver}") do
      it { should exist }
      it { should be_enabled }
      its('mirrors') { should cmp "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{shortver}/mirror" }
    end

    describe ini("/etc/yum.repos.d/remi-php#{shortver}.repo") do
      its("remi-php#{shortver}.gpgcheck") { should cmp 1 }
      its("remi-php#{shortver}.gpgkey") { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
    end
  else
    # Centos 8 or Fedora use module instead of repo
    describe command('dnf module list php') do
      its('stdout') { should match /php +remi-#{version} \[e\]/ }
    end
  end
end
