# Limitations

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
