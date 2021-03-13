describe command('php74 --version') do
  its('stdout') { should match /7.4/ }
end

describe yum.repo('remi-php74') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php74/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php74/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php74/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php74.repo') do
  its('remi-php74.gpgcheck') { should cmp 1 }
  its('remi-php74.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
