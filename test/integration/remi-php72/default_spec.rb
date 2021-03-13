describe command('php --version') do
  its('stdout') { should match /7.2/ }
end

describe yum.repo('remi-php72') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php72/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php72/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php72/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php72.repo') do
  its('remi-php72.gpgcheck') { should cmp 1 }
  its('remi-php72.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
