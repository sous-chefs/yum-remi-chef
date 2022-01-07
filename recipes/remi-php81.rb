#
# Author:: Sean OMeara (<sean@sean.io>)
# Recipe:: yum-remi-chef::remi-php81
#
# Copyright:: 2015-2017, Chef Software, Inc.
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

yum_remi_php81 'default' do
  baseurl node['yum']['remi-php81']['baseurl']
  gpgcheck node['yum']['remi-php81']['gpgcheck']
  enabled node['yum']['remi-php81']['enabled']
  mirrorlist node['yum']['remi-php81']['mirrorlist']
  description node['yum']['remi-php81']['description']
  gpgkey node['yum-remi-chef']['gpgkey']
  only_if { node['yum']['remi-php81']['managed'] }
end
