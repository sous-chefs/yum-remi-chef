describe command('php56 --version') do
  its('stdout') { should match /5.6/ }
end

describe yum.repo('remi-php56') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php56/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php56/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php56/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php56.repo') do
  its('remi-php56.gpgcheck') { should cmp 1 }
  its('remi-php56.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
