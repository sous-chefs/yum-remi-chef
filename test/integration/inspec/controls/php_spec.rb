version = input('version')
shortver = version.delete('.').to_i

control 'php' do
  title 'verify correct version of PHP and repo was installed'

  describe command('php --version') do
    its('stdout') { should match /#{version}/ }
  end

  if (os.redhat? && os.release.to_i == 7) || os.name == 'amazon'
    describe yum.repo("remi-php#{shortver}") do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp case os.name
                   when 'fedora'
                     "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php#{shortver}/#{os.arch}/mirror"
                   when 'amazon'
                     "http://cdn.remirepo.net/enterprise/7/php#{shortver}/mirror"
                   else # rhel
                     if os.release.to_i == 7
                       "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{shortver}/mirror"
                     else
                       "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{shortver}/#{os.arch}/mirror"
                     end
                   end
      end
    end

    describe ini("/etc/yum.repos.d/remi-php#{shortver}.repo") do
      its("remi-php#{shortver}.gpgcheck") { should cmp 1 }
      its("remi-php#{shortver}.gpgkey") do
        should cmp case os.name
                   when 'amazon'
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi'
                   when 'fedora'
                     'https://rpms.remirepo.net/RPM-GPG-KEY-remi2022'
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
  else
    # Centos 8 or Fedora use module instead of repo
    describe command('dnf module list php') do
      its('stdout') { should match /php +remi-#{version} \[e\]/ }
    end
  end
end
