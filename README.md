# yum-remi-chef Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/yum-remi-chef.svg?branch=master)](http://travis-ci.org/chef-cookbooks/yum-remi-chef) [![Cookbook Version](https://img.shields.io/cookbook/v/yum-remi-chef.svg)](https://supermarket.chef.io/cookbooks/yum-remi-chef)

The yum-remi-chef cookbook takes over management of the repository ids of the [remi](http://rpms.remirepo.net/) repository . It allows attribute manipulation of `remi`, `remi-safe`, `remi-php55`, `remi-php56`, `remi-php70`, `remi-php71`, `remi-php72` and `remi-test` repositories.

## Requirements

### Chef

- Chef 12.14+

### Cookbooks

- yum-epel

### Platforms

The following platforms have been tested with Test Kitchen:

```
|-----------+------+-----------+------------+------------+------------+------------+------------|
|           | remi | remi-safe | remi-php55 | remi-php56 | remi-php70 | remi-php71 | remi-php72 |
|-----------+------+-----------+------------+------------+------------+------------+------------|
| centos-5  | X    |           | X          | X          |            |            |            |
|-----------+------+-----------+------------+------------+------------+------------+------------|
| centos-6  | X    | X         | X          | X          | X          | X          | X          |
|-----------+------+-----------+------------+------------+------------+------------+------------|
| centos-7  | X    | X         | X          | X          | X          | X          | X          |
|-----------+------+-----------+------------+------------+------------+------------+------------|
| fedora    | X    |           |            |            | X          | X          | X          |
|-----------+------+-----------+------------+------------+------------+------------+------------|
```

Amazon Linux is _not_ supported by the Remi repository. Amazon maintains their own PHP packages natively, as php53, php54, php55, php56 and php70.

centos-5 with remi-php70, remi-php71 and remi-php72 is _not_ working currently.

## Attributes

The following attributes are set by default

```ruby
default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/remi/mirror'
default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi']['enabled'] = true
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-safe']['repositoryid'] = 'remi-safe'
default['yum']['remi-safe']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/safe/mirror'
default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-safe']['enabled'] = true
default['yum']['remi-safe']['gpgcheck'] = true
default['yum']['remi-safe']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php55']['repositoryid'] = 'remi-php55'
default['yum']['remi-php55']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/php55/mirror'
default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-php55']['enabled'] = true
default['yum']['remi-php55']['gpgcheck'] = true
default['yum']['remi-php55']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php56']['repositoryid'] = 'remi-php56'
default['yum']['remi-php56']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/5/php56/mirror'
default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-php56']['enabled'] = true
default['yum']['remi-php56']['gpgcheck'] = true
default['yum']['remi-php56']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php70']['managed'] = true
default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php70/mirror'
default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php71']['managed'] = true
default['yum']['remi-php71']['repositoryid'] = 'remi-php71'
default['yum']['remi-php71']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php71/mirror'
default['yum']['remi-php71']['description'] = "Remi's PHP 7.1 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php71']['enabled'] = true
default['yum']['remi-php71']['gpgcheck'] = true
default['yum']['remi-php71']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php72']['managed'] = true
default['yum']['remi-php72']['repositoryid'] = 'remi-php72'
default['yum']['remi-php72']['mirrorlist'] = 'http://rpms.remirepo.net/enterprise/6/php72/mirror'
default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php72']['enabled'] = true
default['yum']['remi-php72']['gpgcheck'] = true
default['yum']['remi-php72']['gpgkey'] = 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
```

## Recipes

- default - Walks through node attributes and feeds a yum_resource
- parameters. The following is an example a resource generated by the
- recipe during compilation.

```ruby
  yum_repository 'remi' do
    mirrorlist 'http://rpms.remirepo.net/enterprise/6/remi/mirror'
    description "Remi's RPM repository for Enterprise Linux 6 - $basearch"
    enabled true
    gpgcheck true
    gpgkey 'http://rpms.remirepo.net/RPM-GPG-KEY-remi'
  end
```

## Usage Example

To disable the remi repository through a Role or Environment definition

```ruby
default_attributes(
  :yum => {
    :remi => {
      :enabled => {
        false
       }
     }
   }
 )
```

## More Examples

Point the base and updates repositories at an internally hosted server.

```ruby
node.default['yum']['remi']['enabled'] = true
node.default['yum']['remi']['mirrorlist'] = nil
node.default['yum']['remi']['baseurl'] = 'https://internal.example.com/enterprise/5/remi/$basearch/'
node.default['yum']['remi']['sslverify'] = false

include_recipe 'yum-remi'
```

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2015-2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
