# Limitations

## Package Availability

Sources:

* [Remi repository root](https://rpms.remirepo.net/)
* [Remi Enterprise Linux 8.8 repository](https://rpms.remirepo.net/enterprise/8.8/)
* [Remi Enterprise Linux 9 repository](https://rpms.remirepo.net/enterprise/9/)
* [Remi Enterprise Linux 10 repository](https://rpms.remirepo.net/enterprise/10/)
* [Remi Fedora 42 repository](https://rpms.remirepo.net/fedora/42/)
* [Remi Fedora 44 repository](https://rpms.remirepo.net/fedora/44/)

### DNF/YUM (RHEL family)

* Enterprise Linux 8 repositories are maintained for `x86_64` and `aarch64`; `php:remi-7.2` and `php:remi-7.3` are only available on EL 8.
* Enterprise Linux 9 repositories are maintained for `x86_64` and `aarch64`; the managed PHP module streams are `7.4`, `8.0`, `8.1`, `8.2`, `8.3`, and `8.4`.
* Enterprise Linux 10 repositories are maintained for `x86_64` and `aarch64`; the managed PHP module streams are `7.4`, `8.0`, `8.1`, `8.2`, `8.3`, and `8.4`.
* `remi`, `remi-safe`, `remi-modular`, and `remi-test` are real repositories on EL 8, 9, and 10.
* `remi-phpXX` entries on EL are browsing views, not standalone repositories. This cookbook models them as PHP module stream resources instead of `yum_repository` resources.

### Fedora

* Fedora 42, 43, and 44 are the maintained Fedora releases in Remi as of April 27, 2026.
* Fedora repositories are maintained for `x86_64` and `aarch64`.
* The managed Fedora PHP module streams are `7.4`, `8.0`, `8.1`, `8.2`, `8.3`, and `8.4`.
* `remi`, `remi-modular`, and `remi-test` are real repositories on supported Fedora releases.
* `yum_remi` does not implicitly create `remi-safe` on Fedora because that dependency is only needed on RHEL family platforms.

## Architecture Limitations

* Current integration coverage in this cookbook targets `x86_64` Dokken images only, even though upstream also publishes `aarch64` content.
* Enterprise Linux 8 test packages are listed as `x86_64` only on the upstream package page that was reviewed for this migration.

## Source/Compiled Installation

This cookbook only manages upstream repository configuration and DNF module selection. It does not build PHP or repository content from source.

## Known Issues

* Fedora support is implemented through `fedora-latest` in Kitchen, so Fedora minor coverage tracks the image tag rather than a pinned release number.
* Older closed or EOL upstream releases such as Enterprise Linux 7 and Fedora 41 and earlier are intentionally excluded from this cookbook.
