version = input('version')

control 'default' do
  describe command("php#{version.delete('.').to_i} --version") do
    its('stdout') { should match /#{version}/ }
  end

  describe yum.repo("remi-php#{version.delete('.').to_i}") do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "#{
      case os.name
      when 'fedora'
        "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php#{version.delete('.').to_i}/mirror"
      when 'amazon'
        "http://cdn.remirepo.net/enterprise/7/php#{version.delete('.').to_i}/mirror"
      else
        "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php#{version.delete('.').to_i}/mirror"
      end
    }"
    end
  end

  describe ini("/etc/yum.repos.d/remi-php#{version.delete('.').to_i}.repo") do
    its("remi-php#{version.delete('.').to_i}.gpgcheck") { should cmp 1 }
    its("remi-php#{version.delete('.').to_i}.gpgkey") { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
  end
end
