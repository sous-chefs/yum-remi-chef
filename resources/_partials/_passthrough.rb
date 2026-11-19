# frozen_string_literal: true

include YumRemiChef::Cookbook::Helpers

# Every wrapper passes these down unchanged, so nested declarations of the same repo render identically.
property :mirror_url, [String, Array],
         callbacks: {
           'must be one or more http(s):// or ftp:// URLs' => lambda { |urls|
             !Array(urls).empty? && Array(urls).all? { |url| url.is_a?(String) && url.match?(%r{\A(https?|ftp)://}) }
           },
         }
property :gpgkey, [String, Array], default: lazy { remi_gpg_key }
property :metadata_expire, String, regex: [/^\d+$/, /^\d+[mhd]$/, /never/]
