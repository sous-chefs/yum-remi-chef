shared_examples 'create remi repos' do
  %w(
    remi
    remi-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create remi-test repos' do
  %w(
    remi-test
    remi-test-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create remi-safe repo' do
  it { is_expected.to create_yum_repository('remi-safe') }
end

shared_examples 'create PHP 5.6 repos' do
  %w(
    remi-php56
    remi-php56-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 7.0 repos' do
  %w(
    remi-php70
    remi-php70-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 7.1 repos' do
  %w(
    remi-php71
    remi-php71-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 7.2 repos' do
  %w(
    remi-php72
    remi-php72-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 7.3 repos' do
  %w(
    remi-php73
    remi-php73-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 7.4 repos' do
  %w(
    remi-php74
    remi-php74-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 8.0 repos' do
  %w(
    remi-php80
    remi-php80-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end

shared_examples 'create PHP 8.1 repos' do
  %w(
    remi-php81
    remi-php81-debuginfo
  ).each do |repo|
    it { is_expected.to create_yum_repository(repo) }
  end
end
