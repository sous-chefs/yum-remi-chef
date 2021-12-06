#
# Author:: Sean OMeara (<sean@sean.io>)
# Recipe:: yum-remi-chef::remi-php72
#
# Copyright:: 2015-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

raise "`remi-php72` is not available for #{node['platform']} #{node['platform_version'].to_i}" if platform_family?('fedora')

include_recipe 'yum-remi-chef::remi' unless fedora?
include_recipe 'yum-remi-chef::remi-modular' if rhel_8_or_fedora?

%w(remi-php72 remi-php72-debuginfo).each do |repo|
  next unless node['yum'][repo]['managed']
  yum_repository repo do
    node['yum'][repo].each do |config, value|
      case config
      when 'managed' # rubocop: disable Lint/EmptyWhen
      when 'baseurl'
        send(config.to_sym, lazy { value })
      else
        send(config.to_sym, value) unless value.nil?
      end
    end
    gpgkey node['yum-remi-chef']['gpgkey'] unless node['yum-remi-chef']['gpgkey'].nil?
  end
end
