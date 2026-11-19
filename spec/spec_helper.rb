# frozen_string_literal: true

require 'chefspec'
require 'chefspec/policyfile'

REMI_MIRRORS = %w(https://mirror.usi.edu/pub/remi https://mirror.pit.teraswitch.com/remi).freeze
REMI_GPGKEYS = %w(https://rpms.remirepo.net/RPM-GPG-KEY-remi2021 https://rpms.remirepo.net/RPM-GPG-KEY-remi2024).freeze

RSpec.configure do |config|
  config.color = true               # Use color in STDOUT
  config.formatter = :documentation # Use the specified formatter
  config.log_level = :error         # Avoid deprecation notice SPAM
end
