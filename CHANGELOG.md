# yum-remi-chef CHANGELOG

This file is used to list changes made in each version of the yum-remi-chef  cookbook.

## 7.0.6 - *2023-10-31*

## 7.0.5 - *2023-09-28*

## 7.0.4 - *2023-09-04*

## 7.0.3 - *2023-07-10*

## 7.0.2 - *2023-06-01*

- Remove Circle CI

## 7.0.1 - *2023-06-01*

- Pin dependencies

## 7.0.0 - *2023-06-01*

- Skip creation of debug repos if not enabled
- Remove support for Amazon Linux
- Standardized files
- Remove PHP 5.5 support (deprecated)
- Add missing attributes for PHP 8.2
- Fix support for Fedora 38
- Update tests to support latest platform versions
- Update GitHub Actions

## 6.2.0 - *2022-12-28*

- Add `remi_php82` resource for supporting PHP 8.2
- Add support for AlmaLinux 9, CentOS Stream 9 and Rocky Linux 9
- Remove remaining references to CentOS 8
- Fix CI and update tests

## 6.1.1 - *2022-01-27*

- Add Alma Linux and Rocky Linux to testing
- Remove CentOS 8 (prefer Stream)

## 6.1.0 - *2022-01-08*

- Bump `yum` dependency to `>= 7.3` for proper cache flushing on module switch

## 6.0.0 - *2022-01-07*

- Add missing `remi-modular` repo for DNF modules
- Use DNF modules on supported platforms (CentOS 8+ / Fedora)
- Add `yum_remi_` custom resources
- Use modules & new resources in testing
- Fix repo priority on Amazon Linux

## 5.0.1 - *2021-11-09*

- Remove error on unsupported platforms

## 5.0.0 - *2021-11-03*

- Fix support for CentOS 8 & Fedora
- Use correct domain for debuginfo repos
- Remove 5.5 repo support (removed upstream)
- Add testing for CentOS 8, CentOS Stream 8, Fedora
- Add PHP 8.1 repo

## 4.2.2 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 4.2.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 4.2.0 - *2021-04-05*

- Refactor ChefSpec units to be less repetitious
- Add PHP 8.0 support

## 4.1.1 - *2021-03-26*

- Convert inspec tests to inspec profiles

## 4.1.0 - *2021-03-18*

- Sous Chefs Adoption
- Various Cookstyle fixes
- Add InSpec tests
- Add php 7.4 support

## 4.0.0 (2020-01-18)

- Update mirrorlist from rpms.remirepo.net to cdn.remirepo.net (Closes #18) - [@sekrett](https://github.com/sekrett)
- added support for php 7.3 and removed tests for versions deprecated by remi - [@kevenwyld](https://github.com/kevenwyld)
- Require Chef 12.15+ - [@tas50](https://github.com/tas50)
- Remove RHEL 5 support - [@tas50](https://github.com/tas50)

## 3.0.0 (2018-02-16)

- Fix 7.2 column in platform table in the README.
- Require Chef 12.14+ and remove compat_resource dependency

## 2.3.0 (2018-01-17)

- Use node.override in specs not node.normal
- Added repository for PHP 7.2

## 2.2.2 (2016-12-22)

- Fedora has 7.X release
- Ease reading and revert test change
- Depend on the latest compat_resource cookbook

## 2.2.1 (2016-11-26)

- Use the native inspec formatter now
- Use a slightly better compat_resource

## 2.2.0 (2016-10-31)

- Adding php 7.1 repository.

## 2.1.0 (2016-10-23)

- Added the remi-safe repository.
- Replace yum dependency with compat_resource

## 2.0.0 (2016-09-06)

- Remove Chef 11 support

## v1.2.1 (2016-09-04)

- Updated Amazon Linux support
- Cleaned up attributes file

## v1.2.0 (2016-04-30)

- Added Amazon Linux support to the PHP7 repo
- Added Amazon Linux 2016 support to all other repos
- Converted testing to Inspec to properly test on Fedora
- Added testing in Travis CI with Kitchen-Dokken

## v1.1.4 (2016-03-17)

- php7 repo added [@vvchik](https://github.com/vvchik) [PR #2](https://github.com/chef-cookbooks/yum-remi-chef/pull/2)

## v1.0.4 (2016-02-16)

- Add support for Amazon Linux

## v1.0.3 (2015-11-30)

- Fixed false values not being passed

## v1.0.2 (2015-10-28)

- Fixing Chef 13 nil property deprecation warnings

## v1.0.1 (2015-09-21)

- Fix repo URLs in metadata

## v1.0.0 (2015-09-21)

- Fixed the cookbook name in the metadata, readme, and tests. The cookbook repo was named yum-remi-chef, supermarket listed it as yum-remi-chef, but the metadata listed yum-remi, which is a name already used on Supermarket. The metadata has been corrected to use the same name. If you used this cookbook previously you'll need to update all references to use the new name.
- Added Yum dependency to the metadata
- Added Chef standard Rubocop file
- Added Travis CI config
- Added Chef standard chefignore and .gitignore files
- Updated and expanded development dependencies in the Gemfile
- Added contributing, testing, and maintainers docs
- Added Travis and cookbook version badges to the readme
- Added Oracle Linux and Amazon Linux to the metadata

## v0.1.1 (2015-06-30)

Fixing up some tests

## v0.1.0

initial release
