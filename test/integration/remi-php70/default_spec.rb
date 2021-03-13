describe command('php --version') do
  its('stdout') { should match /7.0/ }
end

describe yum.repo('remi-php70') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php70/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php70/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php70/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php70.repo') do
  its('remi-php70.gpgcheck') { should cmp 1 }
  its('remi-php70.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
