mirrors = %w(https://ftp2.osuosl.org/pub/remi https://mirror.usi.edu/pub/remi)
rel = os.release.to_i
key_year = { 8 => '2018', 9 => '2021', 10 => '2024' }[rel]
repos = { 'remi-safe' => 'safe', 'remi' => 'remi', 'remi-modular' => 'modular' }

control 'remi-mirror' do
  title 'verify the Remi repos use the configured mirrors in order, with no mirrorlist'

  repos.each do |repo, slug|
    describe file("/etc/yum.repos.d/#{repo}.repo") do
      its('content') { should_not match(/^mirrorlist=/) }
      its('content') { should_not match(/cdn\.remirepo\.net/) }
      its('content') { should match(%r{^gpgkey=https://rpms\.remirepo\.net/RPM-GPG-KEY-remi#{key_year}$}) }
      its('content') { should match(/^metadata_expire=6h$/) }
    end

    describe yum.repo(repo) do
      it { should exist }
      it { should be_enabled }
      its('baseurl') { should cmp mirrors.map { |m| "#{m}/enterprise/#{rel}/#{slug}/#{os.arch}/" }.join(', ') }
    end

    # dnf falls back to the next mirror on a 404, so check each root serves this repo itself.
    mirrors.each do |mirror|
      describe command("curl -fsS -o /dev/null #{mirror}/enterprise/#{rel}/#{slug}/#{os.arch}/repodata/repomd.xml") do
        its('exit_status') { should eq 0 }
      end
    end
  end

  describe command('dnf -q makecache --disablerepo=* --enablerepo=remi-safe --enablerepo=remi --enablerepo=remi-modular') do
    its('exit_status') { should eq 0 }
  end
end

control 'remi-mirror-php' do
  title 'verify PHP 8.4 installs from the mirrored module stream'

  describe command('php --version') do
    its('stdout') { should match(/^PHP 8\.4\./) }
  end

  describe command('dnf module list php') do
    its('stdout') { should match(/php +remi-8\.4 \[e\]/) }
  end
end
