#
# Author:: Lance Albertson (<lance@osuosl.org>)
# Recipe:: yum-remi-chef::remi-php84
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

yum_remi_php84 'default' do
  baseurl node['yum']['remi-php84']['baseurl']
  gpgcheck node['yum']['remi-php84']['gpgcheck']
  enabled node['yum']['remi-php84']['enabled']
  mirrorlist node['yum']['remi-php84']['mirrorlist']
  description node['yum']['remi-php84']['description']
  gpgkey node['yum-remi-chef']['gpgkey']
  only_if { node['yum']['remi-php84']['managed'] }
end
