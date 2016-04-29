case node['platform']
when 'fedora'
  case node['platform_version'].to_i
  when 21, 22, 23
    default['yum-remi-chef']['repositories'] = %w(remi remi-php70)
    default['yum-remi-chef']['conflicts'] = %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-safe
      remi-test-debuginfo
    )
  else
    default['yum-remi-chef']['repositories'] = %w(remi remi-php56)
    default['yum-remi-chef']['conflicts'] = %w(
      remi-debuginfo
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-php70
      remi-safe
      remi-test-debuginfo
    )
  end
else
  case node['platform_version'].to_i
  when 5
    default['yum-remi-chef']['repositories'] = %w(remi remi-safe remi-php56)
    default['yum-remi-chef']['conflicts'] = %w(
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-php70
    )
  when 6, 7
    default['yum-remi-chef']['repositories'] = %w(remi remi-safe remi-php70)
    default['yum-remi-chef']['conflicts'] = %w(
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
    )
  else
    default['yum-remi-chef']['repositories'] = %w(remi)
    default['yum-remi-chef']['conflicts'] = %w(
      remi-debuginfo
      remi-dev
      remi-php55-debuginfo
      remi-php55
      remi-php56-debuginfo
      remi-php56
      remi-php70-debuginfo
      remi-php70-test-debuginfo
      remi-php70-test
      remi-php70
      remi-safe
      remi-test-debuginfo
      remi-test
    )
  end
end
