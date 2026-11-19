# AGENTS.md

## Cookbook Purpose

Installs and configures the Remi\

## Agent Findings

* This cookbook is in an incremental modernization pass. Preserve existing public recipes and attributes unless a later full migration is explicitly selected.
* Dependency management should use `Policyfile.rb`; do not reintroduce Berkshelf.
* The resources nest: `yum_remi_phpXX` declares `yum_remi` and `yum_remi_modular`, `yum_remi_modular` and `yum_remi_test` declare `yum_remi`, and `yum_remi` declares `yum_remi_safe`, each as `'default'`. Every level must pass `manage_epel`, `mirror_url`, `gpgkey` and `metadata_expire` down (see `_partials/_passthrough.rb`). A level that drops one renders that repo file with defaults, and the nested declarations rewrite it on every run.
* ChefSpec matchers such as `create_yum_remi('default').with(...)` only see the last declaration of a resource. When a wrapper and a nested resource both declare it, assert on `find_resources` to check every one.

## Known Limitations

This cookbook manages Remi RPM repositories and PHP module streams through custom
resources.

## Supported Platforms

Remi's repository currently publishes packages for Fedora and Enterprise Linux
families. Recent Remi announcements list packages for Fedora 42 and newer and
Enterprise Linux 8 and newer, including RHEL, AlmaLinux, CentOS, and Rocky Linux.

The cookbook preserves its existing Enterprise Linux platform support and verifies
the default workflow on AlmaLinux 9. No platform support was removed as part of
the release-readiness cleanup.

## Package Constraints

Remi's PHP stream support follows PHP upstream lifecycles and Remi repository
availability. Older streams may remain available on a best-effort basis after
upstream PHP retirement, but users should prefer maintained PHP versions. The
resources expose repository and module actions so callers can create or remove
repository definitions explicitly.
