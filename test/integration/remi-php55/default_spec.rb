describe command('php55 --version') do
  its('stdout') { should match /5.5/ }
end

describe yum.repo('remi-php55') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php55/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php55/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php55/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php55.repo') do
  its('remi-php55.gpgcheck') { should cmp 1 }
  its('remi-php55.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
