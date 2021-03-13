describe command('php --version') do
  its('stdout') { should match /7.1/ }
end

describe yum.repo('remi-php71') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') do
    should cmp "#{
    case os.name
    when 'fedora'
      "http://cdn.remirepo.net/fedora/#{os.release.to_i}/php71/mirror"
    when 'amazon'
      'http://cdn.remirepo.net/enterprise/7/php71/mirror'
    else
      "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/php71/mirror"
    end
  }"
  end
end

describe ini('/etc/yum.repos.d/remi-php71.repo') do
  its('remi-php71.gpgcheck') { should cmp 1 }
  its('remi-php71.gpgkey') { should cmp 'https://rpms.remirepo.net/RPM-GPG-KEY-remi' }
end
