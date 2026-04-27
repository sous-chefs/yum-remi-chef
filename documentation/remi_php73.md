# `yum_remi_php73`

[Back to resource list](../README.md#resources)

Enables the `php:remi-7.3` DNF module stream after configuring the required Remi repositories.

> `php:remi-7.3` is only available on Enterprise Linux 8.

## Actions

| Action    | Description                           |
| --------- | ------------------------------------- |
| `:create` | Configures Remi and enables the stream |

## Properties

This resource does not expose repository properties. If you need to customize repository configuration, manage `yum_remi` and `yum_remi_modular` explicitly before declaring `yum_remi_php73`.

## Examples

```ruby
yum_remi_php73 'default'
```
