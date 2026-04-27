# Limitations

## Package Availability

Sources:

* [Remi repository root](https://rpms.remirepo.net/)
* [Remi Enterprise Linux 8 repository](https://rpms.remirepo.net/enterprise/8/)
* [Remi Enterprise Linux 9 repository](https://rpms.remirepo.net/enterprise/9/)
* [Remi Enterprise Linux 10 repository](https://rpms.remirepo.net/enterprise/10/)

### DNF/YUM (RHEL family)

* Enterprise Linux 8 repositories are maintained for `x86_64` and `aarch64`; `php:remi-7.2` and `php:remi-7.3` are only available on EL 8.
* Enterprise Linux 9 repositories are maintained for `x86_64` and `aarch64`; the managed PHP module streams are `7.4`, `8.0`, `8.1`, `8.2`, `8.3`, and `8.4`.
* Enterprise Linux 10 repositories are maintained for `x86_64` and `aarch64`; the managed PHP module streams are `7.4`, `8.0`, `8.1`, `8.2`, `8.3`, and `8.4`.
* `remi`, `remi-safe`, `remi-modular`, and `remi-test` are real repositories on EL 8, 9, and 10.
* `remi-phpXX` entries on EL are browsing views, not standalone repositories. This cookbook models them as PHP module stream resources instead of `yum_repository` resources.

## Architecture Limitations

* Current integration coverage in this cookbook targets `x86_64` Dokken images only, even though upstream also publishes `aarch64` content.
* Enterprise Linux 8 test packages are listed as `x86_64` only on the upstream package page that was reviewed for this migration.

## Source/Compiled Installation

This cookbook only manages upstream repository configuration and DNF module selection. It does not build PHP or repository content from source.

## Known Issues

* Older closed or EOL upstream releases such as Enterprise Linux 7 and earlier are intentionally excluded from this cookbook.
