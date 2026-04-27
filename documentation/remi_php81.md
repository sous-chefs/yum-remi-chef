# `yum_remi_php81`

[Back to resource list](../README.md#resources)

Enables the `php:remi-8.1` DNF module stream after configuring the required Remi repositories.

## Actions

| Action    | Description                           |
| --------- | ------------------------------------- |
| `:create` | Configures Remi and enables the stream |

## Properties

This resource does not expose repository properties. If you need to customize repository configuration, manage `yum_remi` and `yum_remi_modular` explicitly before declaring `yum_remi_php81`.

## Examples

```ruby
yum_remi_php81 'default'
```
