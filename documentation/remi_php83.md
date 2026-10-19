# `yum_remi_php83`

[Back to resource list](../README.md#resources)

Enables the `php:remi-8.3` DNF module stream after configuring the required Remi repositories.

## Actions

| Action    | Description                            |
|-----------|----------------------------------------|
| `:create` | Configures Remi and enables the stream |
| `:remove` | Resets the DNF module stream           |

## Properties

| Name          | Type            | Default |
|---------------|-----------------|---------|
| `manage_epel` | `true`, `false` | `true`  |

`manage_epel` is passed to the `yum_remi` and `yum_remi_modular` it declares. Set it to `false` where another cookbook already manages EPEL. For any other repository configuration, manage `yum_remi` and `yum_remi_modular` explicitly before declaring `yum_remi_php83`.

## Examples

```ruby
yum_remi_php83 'default'
```
