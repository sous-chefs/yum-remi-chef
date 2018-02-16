# yum-remi-chef CHANGELOG
This file is used to list changes made in each version of the yum-remi-chef  cookbook.

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
