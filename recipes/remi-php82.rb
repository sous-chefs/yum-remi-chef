#
# Author:: Lance Albertson (<lance@osuosl.org>)
# Recipe:: yum-remi-chef::remi-php82
#
# Copyright:: 2022, Oregon State University
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

yum_remi_php82 'default' do
  baseurl node['yum']['remi-php82']['baseurl']
  gpgcheck node['yum']['remi-php82']['gpgcheck']
  enabled node['yum']['remi-php82']['enabled']
  mirrorlist node['yum']['remi-php82']['mirrorlist']
  description node['yum']['remi-php82']['description']
  gpgkey node['yum-remi-chef']['gpgkey']
  only_if { node['yum']['remi-php82']['managed'] }
end
