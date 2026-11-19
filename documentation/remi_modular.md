# `yum_remi_modular`

[Back to resource list](../README.md#resources)

Adds the `remi-modular` repo to the YUM / DNF repo list.

## Actions

| Action    | Description                    |
|-----------|--------------------------------|
| `:create` | Creates the repo configuration |
| `:remove` | Removes the repo configuration |

## Properties

These properties are passed through to `yum_repository`. More information on these properties can be found on [the Chef docs for `yum_repository`](https://docs.chef.io/resources/yum_repository/).

| Name                | Type              | Default                                                                                                  |
|---------------------|-------------------|----------------------------------------------------------------------------------------------------------|
| `baseurl`           | `String`, `Array` | Platform specific, see [`remi_repo_baseurl`](../libraries/helpers.rb)                                    |
| `mirrorlist`        | `String`, `nil`   | Platform specific, see [`remi_repo_mirrorlist`](../libraries/helpers.rb), `nil` when `mirror_url` is set |
| `mirror_url`        | `String`, `Array` | `nil` (Remi's own servers)                                                                               |
| `description`       | `String`          | Platform specific, see [`remi_repo_description`](../libraries/helpers.rb)                                |
| `enabled`           | `true`, `false`   | `true`                                                                                                   |
| `debug_baseurl`     | `String`, `Array` | Platform specific, see [`remi_repo_baseurl`](../libraries/helpers.rb)                                    |
| `debug_description` | `String`          | Platform specific, see [`remi_repo_description`](../libraries/helpers.rb)                                |
| `debug_enabled`     | `true`, `false`   | `false`                                                                                                  |
| `manage_epel`       | `true`, `false`   | `true`                                                                                                   |
| `gpgkey`            | `String`, `Array` | Platform specific, see [`remi_gpg_key`](../libraries/helpers.rb)                                         |
| `gpgcheck`          | `true`, `false`   | `true`                                                                                                   |
| `metadata_expire`   | `String`          | `nil` (dnf's default)                                                                                    |

`manage_epel` is passed to the `yum_remi` it declares, which configures EPEL through `yum_epel` unless it is `false`.

### Mirrors, keys and metadata

`mirror_url` takes the root of a mirror of `rpms.remirepo.net`, or an Array of roots in order of preference. Each repo's `baseurl` becomes `<root>/enterprise/<release>/<repo>/$basearch/`, one line per root, and no `mirrorlist` is written. dnf tries the roots in order, so a root that lacks a tree (some mirrors carry no `test` or debuginfo repos) falls through to the next one. An explicit `baseurl` or `mirrorlist` still wins.

`gpgkey` also takes an Array, but it is not a fallback list: dnf imports every key listed and fails the install if any of them cannot be fetched.

`metadata_expire` is written to each repo when set. Remi's repo files leave it unset, so dnf's default of 48 hours applies.

`mirror_url`, `gpgkey`, `metadata_expire` and `manage_epel` are passed to the `yum_remi` it declares, which passes them on to `yum_remi_safe`. Give every Remi resource on a node the same values, or the nested declarations rewrite each other's repo files on every run.

## Examples

```ruby
# Setup the remi-modular repo
yum_remi_modular 'default'

# the php modules are now available
dnf_module 'php:remi-8.1'
```

```ruby
yum_remi_modular 'default' do
  mirror_url %w(https://mirror.example.org/remi https://mirror2.example.org/remi)
  metadata_expire '6h'
end
```
