[Back to resource list](../README.md#resources)

# `yum_remi_php81`

Adds the `remi-php81` repo to the YUM / DNF repo list.

> ⚠ This repo **overrides** the system PHP packages!

## Actions

| Action    | Description                    |
| --------- | ------------------------------ |
| `:create` | Creates the repo configuration |

## Properties

These properties are passed through to `yum_repository`. More information on these properties can be found on [the Chef docs for `yum_repository`](https://docs.chef.io/resources/yum_repository/).

| Name                | Type            | Default                                                                   |
| ------------------- | --------------- | ------------------------------------------------------------------------- |
| `baseurl`           | `String`        | Platform specific, see [`remi_repo_baseurl`](../libraries/helpers.rb)     |
| `mirrorlist`        | `String`        | Platform specific, see [`remi_repo_mirrorlist`](../libraries/helpers.rb)  |
| `description`       | `String`        | Platform specific, see [`remi_repo_description`](../libraries/helpers.rb) |
| `enabled`           | `true`, `false` | `true`                                                                    |
| `debug_baseurl`     | `String`        | Platform specific, see [`remi_repo_baseurl`](../libraries/helpers.rb)     |
| `debug_description` | `String`        | Platform specific, see [`remi_repo_description`](../libraries/helpers.rb) |
| `debug_enabled`     | `true`, `false` | `false`                                                                   |
| `gpgkey`            | `String`        | Platform specific, see [`remi_gpg_key`](../libraries/helpers.rb)          |
| `gpgcheck`          | `true`, `false` | `true`                                                                    |

## Examples

```ruby
yum_remi_php81 'default'
```
