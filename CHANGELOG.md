# yum-remi-chef CHANGELOG

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
- Fixed the cookbook name in the metadata, readme, and tests.  The cookbook repo was named yum-remi-chef, supermarket listed it as yum-remi-chef, but the metadata listed yum-remi, which is a name already used on Supermarket.  The metadata has been corrected to use the same name.  If you used this cookbook previously you'll need to update all references to use the new name.
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
