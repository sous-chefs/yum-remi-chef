# frozen_string_literal: true

require 'chefspec'
require 'chefspec/policyfile'

REMI_MIRRORS = %w(https://ftp2.osuosl.org/pub/remi https://mirror.usi.edu/pub/remi).freeze
REMI_GPGKEYS = %w(https://ftp2.osuosl.org/pub/remi/RPM-GPG-KEY-remi https://rpms.remirepo.net/RPM-GPG-KEY-remi).freeze

RSpec.configure do |config|
  config.color = true               # Use color in STDOUT
  config.formatter = :documentation # Use the specified formatter
  config.log_level = :error         # Avoid deprecation notice SPAM
end
