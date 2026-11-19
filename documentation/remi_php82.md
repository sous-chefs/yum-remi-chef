# `yum_remi_php82`

[Back to resource list](../README.md#resources)

Enables the `php:remi-8.2` DNF module stream after configuring the required Remi repositories.

## Actions

| Action    | Description                            |
|-----------|----------------------------------------|
| `:create` | Configures Remi and enables the stream |
| `:remove` | Resets the DNF module stream           |

## Properties

| Name              | Type              | Default                                                          |
|-------------------|-------------------|------------------------------------------------------------------|
| `manage_epel`     | `true`, `false`   | `true`                                                           |
| `mirror_url`      | `String`, `Array` | `nil` (Remi's own servers)                                       |
| `gpgkey`          | `String`, `Array` | Platform specific, see [`remi_gpg_key`](../libraries/helpers.rb) |
| `metadata_expire` | `String`          | `nil` (dnf's default)                                            |

`manage_epel` is passed to the `yum_remi` and `yum_remi_modular` it declares. Set it to `false` where another cookbook already manages EPEL. `mirror_url`, `gpgkey` and `metadata_expire` are passed down the same way; see [`yum_remi`](remi.md#mirrors-keys-and-metadata) for what they do. Do not also declare `yum_remi` or `yum_remi_modular` yourself with other values: the declarations share the same repo files and would rewrite them on every run.

## Examples

```ruby
yum_remi_php82 'default'
```
