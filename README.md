# yum-remi-chef Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-remi-chef.svg)](https://supermarket.chef.io/cookbooks/yum-remi-chef)
[![CI State](https://github.com/sous-chefs/yum-remi-chef/workflows/ci/badge.svg)](https://github.com/sous-chefs/yum-remi-chef/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

The yum-remi-chef cookbook takes over management of the repository ids of the [remi](http://cdn.remirepo.net/) repository . It allows attribute manipulation of `remi`, `remi-safe`, `remi-php55`, `remi-php56`, `remi-php70`, `remi-php71`, `remi-php72`, `remi-php73`, `remi-php74`, `remi-php80`, and `remi-test` repositories.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit sous-chefs.org or come chat with us on the Chef Community Slack in #sous-chefs.

## Requirements

### Chef

- Chef 12.14+

### Cookbooks

- yum-epel

### Platforms

The following platforms have been tested with Test Kitchen:

```
|-----------+------+------------+------------+------------+------------+------------+------------+------------|
|           | remi | remi-safe  | remi-php55 | remi-php56 | remi-php70 | remi-php71 | remi-php72 | remi-php73 |
|-----------+------+------------+------------+------------+------------+------------+------------+------------|
| centos-6  | X    | X          | X          | X          | X          | X          | X          | X          |
|-----------+------+------------+------------+------------+------------+------------+------------+------------|
| centos-7  | X    | X          | X          | X          | X          | X          | X          | X          |
|-----------+------+------------+------------+------------+------------+------------+------------+------------|
| fedora    | X    | NO SUPPORT | NO SUPPORT | NO SUPPORT | NO SUPPORT | NO SUPPORT | X          | X          |
|-----------+------+------------+------------+------------+------------+------------+------------+------------|
```

Amazon Linux is _not_ supported by the Remi repository. Amazon maintains their own PHP packages natively, as php53, php54, php55, php56 and php70.

centos-5 with remi-php70, remi-php71 and remi-php72 is _not_ working currently.

Remirepo does not support php < 7.2 on Fedora.

## Attributes

The following attributes are set by default

```ruby
default['yum']['remi']['repositoryid'] = 'remi'
default['yum']['remi']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/5/remi/mirror'
default['yum']['remi']['description'] = "Remi's RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi']['enabled'] = true
default['yum']['remi']['gpgcheck'] = true
default['yum']['remi']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-safe']['repositoryid'] = 'remi-safe'
default['yum']['remi-safe']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/5/safe/mirror'
default['yum']['remi-safe']['description'] = "Safe Remi's RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-safe']['enabled'] = true
default['yum']['remi-safe']['gpgcheck'] = true
default['yum']['remi-safe']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php55']['repositoryid'] = 'remi-php55'
default['yum']['remi-php55']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/5/php55/mirror'
default['yum']['remi-php55']['description'] = "Remi's PHP 5.5 RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-php55']['enabled'] = true
default['yum']['remi-php55']['gpgcheck'] = true
default['yum']['remi-php55']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php56']['repositoryid'] = 'remi-php56'
default['yum']['remi-php56']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/5/php56/mirror'
default['yum']['remi-php56']['description'] = "Remi's PHP 5.6 RPM repository for Enterprise Linux 5 - $basearch"
default['yum']['remi-php56']['enabled'] = true
default['yum']['remi-php56']['gpgcheck'] = true
default['yum']['remi-php56']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php70']['managed'] = true
default['yum']['remi-php70']['repositoryid'] = 'remi-php70'
default['yum']['remi-php70']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/6/php70/mirror'
default['yum']['remi-php70']['description'] = "Remi's PHP 7.0 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php70']['enabled'] = true
default['yum']['remi-php70']['gpgcheck'] = true
default['yum']['remi-php70']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php71']['managed'] = true
default['yum']['remi-php71']['repositoryid'] = 'remi-php71'
default['yum']['remi-php71']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/6/php71/mirror'
default['yum']['remi-php71']['description'] = "Remi's PHP 7.1 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php71']['enabled'] = true
default['yum']['remi-php71']['gpgcheck'] = true
default['yum']['remi-php71']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php72']['managed'] = true
default['yum']['remi-php72']['repositoryid'] = 'remi-php72'
default['yum']['remi-php72']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/6/php72/mirror'
default['yum']['remi-php72']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php72']['enabled'] = true
default['yum']['remi-php72']['gpgcheck'] = true
default['yum']['remi-php72']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php73']['managed'] = true
default['yum']['remi-php73']['repositoryid'] = 'remi-php73'
default['yum']['remi-php73']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/6/php73/mirror'
default['yum']['remi-php73']['description'] = "Remi's PHP 7.2 RPM repository for Enterprise Linux 6 - $basearch"
default['yum']['remi-php73']['enabled'] = true
default['yum']['remi-php73']['gpgcheck'] = true
default['yum']['remi-php73']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php74']['managed'] = true
default['yum']['remi-php74']['repositoryid'] = 'remi-php74'
default['yum']['remi-php74']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/7/php74/mirror'
default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Enterprise Linux 7 - $basearch"
default['yum']['remi-php74']['enabled'] = true
default['yum']['remi-php74']['gpgcheck'] = true
default['yum']['remi-php74']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

```ruby
default['yum']['remi-php80']['managed'] = true
default['yum']['remi-php80']['repositoryid'] = 'remi-php80'
default['yum']['remi-php80']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/7/php80/mirror'
default['yum']['remi-php80']['description'] = "Remi's PHP 8.0 RPM repository for Enterprise Linux 7 - $basearch"
default['yum']['remi-php80']['enabled'] = true
default['yum']['remi-php80']['gpgcheck'] = true
default['yum']['remi-php80']['gpgkey'] = 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
```

## Recipes

- default - Walks through node attributes and feeds a yum_resource itsparameters. The following is an example of a resource generated by the recipe during compilation.

```ruby
  yum_repository 'remi' do
    mirrorlist 'http://cdn.remirepo.net/enterprise/6/remi/mirror'
    description "Remi's RPM repository for Enterprise Linux 6 - $basearch"
    enabled true
    gpgcheck true
    gpgkey 'http://cdn.remirepo.net/RPM-GPG-KEY-remi'
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

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
