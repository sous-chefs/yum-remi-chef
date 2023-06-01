# yum-remi-chef Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-remi-chef.svg)](https://supermarket.chef.io/cookbooks/yum-remi-chef)
[![CI State](https://github.com/sous-chefs/yum-remi-chef/workflows/ci/badge.svg)](https://github.com/sous-chefs/yum-remi-chef/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

The yum-remi-chef cookbook takes over management of the repository ids of the [remi](https://rpms.remirepo.net/) repository . It allows attribute manipulation of `remi`, `remi-safe`, `remi-php56`, `remi-php70`, `remi-php71`, `remi-php72`, `remi-php73`, `remi-php74`, `remi-php80`, `remi-php81`, `remi-php82` and `remi-test` repositories.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org) or come chat with us on the Chef Community Slack in `#sous-chefs`.

## Requirements

### Chef

- Chef 16+

### Cookbooks

- yum >= 7.3.0
- yum-epel

### Platforms

The following platforms and PHP versions are supported, as per [upstream](https://rpms.remirepo.net) -- `x` via a Yum repo, `M` via DNF modules:

| PHP version     | 5.6 | 7.0 | 7.1 | 7.2 | 7.3 | 7.4 | 8.0 | 8.1 | 8.2 |
| --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AlmaLinux 8     |     |     |     | M   | M   | M   | M   | M   | M   |
| AlmaLinux 9     |     |     |     |     |     | M   | M   | M   | M   |
| CentOS 7        | x   | x   | x   | x   | x   | x   | x   | x   | x   |
| CentOS Stream 8 |     |     |     | M   | M   | M   | M   | M   | M   |
| CentOS Stream 9 |     |     |     |     |     | M   | M   | M   | M   |
| Fedora (latest) |     |     |     |     |     |     |     | M   | M   |
| Rocky Linux 8   |     |     |     | M   | M   | M   | M   | M   | M   |
| Rocky Linux 9   |     |     |     |     |     | M   | M   | M   | M   |

## Recipes

- `::remi` - Sets up the base remi repository.
- `::remi-safe` - Sets up the remi-safe repo. This contains the `phpXX` "software collections" packages, able to coexist with stock PHP.
- `::remi-test` - Sets up the remi-test experimental repo.
- `::remi-modular` - Sets up the remi-modular repo for DNF module information. (Only for platforms that support DNF modules i.e. CentOS 8+ / Fedora)
- `::remi-phpXX` - Sets up the corresponding remi PHP version repo. These repos **override** the stock PHP packages. See the above table for supported versions.

## Resources

Same function as the above recipes, but as resources instead.

- [`yum_remi`](documentation/remi.md)
- [`yum_remi_safe`](documentation/remi_safe.md)
- [`yum_remi_test`](documentation/remi_test.md)
- [`yum_remi_modular`](documentation/remi_modular.md)
- [`yum_remi_php56`](documentation/remi_php56.md)
- [`yum_remi_php70`](documentation/remi_php70.md)
- [`yum_remi_php71`](documentation/remi_php71.md)
- [`yum_remi_php72`](documentation/remi_php72.md)
- [`yum_remi_php73`](documentation/remi_php73.md)
- [`yum_remi_php74`](documentation/remi_php74.md)
- [`yum_remi_php80`](documentation/remi_php80.md)
- [`yum_remi_php81`](documentation/remi_php81.md)
- [`yum_remi_php82`](documentation/remi_php82.md)

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
