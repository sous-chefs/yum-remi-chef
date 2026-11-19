# `yum_remi_safe`

[Back to resource list](../README.md#resources)

Adds the `remi-safe` repo to the YUM / DNF repo list.

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
| `manage_epel`       | `true`, `false`   | `true`                                                                                                   |
| `debug_baseurl`     | `String`, `Array` | Platform specific, see [`remi_repo_baseurl`](../libraries/helpers.rb)                                    |
| `debug_description` | `String`          | Platform specific, see [`remi_repo_description`](../libraries/helpers.rb)                                |
| `debug_enabled`     | `true`, `false`   | `false`                                                                                                  |
| `gpgkey`            | `String`, `Array` | Platform specific, see [`remi_gpg_key`](../libraries/helpers.rb)                                         |
| `gpgcheck`          | `true`, `false`   | `true`                                                                                                   |
| `metadata_expire`   | `String`          | `nil` (dnf's default)                                                                                    |

### Mirrors, keys and metadata

`mirror_url` takes the root of a mirror of `rpms.remirepo.net`, or an Array of roots in order of preference. Each repo's `baseurl` becomes `<root>/enterprise/<release>/<repo>/$basearch/`, one line per root, and no `mirrorlist` is written. dnf tries the roots in order, so a root that lacks a tree (some mirrors carry no `test` or debuginfo repos) falls through to the next one. An explicit `baseurl` or `mirrorlist` still wins.

`gpgkey` also takes an Array, but it is not a fallback list: dnf imports every key listed and fails the install if any of them cannot be fetched.

`metadata_expire` is written to each repo when set. Remi's repo files leave it unset, so dnf's default of 48 hours applies.

## Examples

```ruby
yum_remi_safe 'default'
```

```ruby
yum_remi_safe 'default' do
  manage_epel false
end
```

```ruby
yum_remi_safe 'default' do
  mirror_url %w(https://mirror.example.org/remi https://mirror2.example.org/remi)
  metadata_expire '6h'
end
```
