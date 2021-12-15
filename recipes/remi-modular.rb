#
# Author:: Sean OMeara (<sean@sean.io>)
# Recipe:: yum-remi-chef::remi-modular
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

yum_remi_modular 'default' do
  baseurl node['yum']['remi-modular']['baseurl']
  mirrorlist node['yum']['remi-modular']['mirrorlist']
  description node['yum']['remi-modular']['description']
  enabled node['yum']['remi-modular']['enabled']
  debug_baseurl node['yum']['remi-modular-debuginfo']['baseurl']
  debug_description node['yum']['remi-modular-debuginfo']['description']
  debug_enabled node['yum']['remi-modular-debuginfo']['enabled']
  gpgcheck node['yum']['remi-modular']['gpgcheck']
  gpgkey node['yum-remi-chef']['gpgkey']
  only_if { node['yum']['remi-modular']['managed'] }
end
