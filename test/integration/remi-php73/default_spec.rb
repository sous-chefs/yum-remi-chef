describe command('php73 --version') do
  its('stdout') { should match /7.3/ }
end

describe yum.repo('remi-php73') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php73/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php73/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php73/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php73.repo') do
  its('remi-php73.gpgcheck') { should cmp 1 }
  its('remi-php73.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
