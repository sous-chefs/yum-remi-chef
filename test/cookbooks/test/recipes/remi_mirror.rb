# frozen_string_literal: true

# Declares yum_remi_safe both directly and through a php wrapper, as a host running
# SCL and module PHP side by side does; idempotency fails if the two disagree.
mirrors = %w(https://mirror.usi.edu/pub/remi https://mirror.pit.teraswitch.com/remi)
key_year = { 8 => '2018', 9 => '2021', 10 => '2024' }[node['platform_version'].to_i]
gpgkeys = ["https://rpms.remirepo.net/RPM-GPG-KEY-remi#{key_year}"]

yum_epel 'default'

yum_remi_safe 'default' do
  manage_epel false
  mirror_url mirrors
  gpgkey gpgkeys
  metadata_expire '6h'
end

yum_remi_php84 'default' do
  manage_epel false
  mirror_url mirrors
  gpgkey gpgkeys
  metadata_expire '6h'
end

package 'php'
