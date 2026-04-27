# Migration Guide

This cookbook now exposes Remi configuration exclusively through custom resources.

## Breaking Changes

* Root cookbook recipes were removed. Replace `include_recipe 'yum-remi-chef::…'` with direct resource usage.
* Root cookbook attributes were removed. Replace `node['yum'][…]` overrides with resource properties where those properties still have meaning.
* The `yum_remi_phpXX` resources now model PHP module stream selection only. They no longer pretend to manage standalone `remi-phpXX` repositories.

## Common Replacements

### Base repository

Before:

```ruby
node.default['yum']['remi']['enabled'] = true
include_recipe 'yum-remi-chef::remi'
```

After:

```ruby
yum_remi 'default' do
  enabled true
end
```

### Test repository

Before:

```ruby
node.default['yum']['remi-test']['enabled'] = true
include_recipe 'yum-remi-chef::remi-test'
```

After:

```ruby
yum_remi_test 'default'
```

### PHP module stream

Before:

```ruby
include_recipe 'yum-remi-chef::remi-php84'
```

After:

```ruby
yum_remi_php84 'default'
```

## PHP Stream Customization

The versioned PHP resources now manage three things only:

* ensuring the base Remi repositories are configured
* ensuring the Remi modular repository is configured
* switching the host to the matching `php:remi-*` DNF module stream

If you need repository-level customization, manage those repositories explicitly with `yum_remi`, `yum_remi_safe`, or `yum_remi_modular` before declaring the PHP stream resource.
