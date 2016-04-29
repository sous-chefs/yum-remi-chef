@test "verify repository files exist" {
    [ -e "/etc/yum.repos.d/epel.repo" ] || cat /etc/redhat-release | grep ^Fedora
    [ ! -e "/etc/yum.repos.d/remi-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-dev.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php55-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php55.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php56-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php56.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-test-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-test.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70.repo" ]
    [ -e "/etc/yum.repos.d/remi-safe.repo" ] || cat /etc/redhat-release | grep ^Fedora
    [ ! -e "/etc/yum.repos.d/remi-test-debuginfo.repo" ]
    [ -e "/etc/yum.repos.d/remi-test.repo" ]
    [ -e "/etc/yum.repos.d/remi.repo" ]
}

@test "install a package" {
    yum install -y php
}

@test "verify expected version" {
    php --version | grep "^PHP 5.4" || cat /etc/redhat-release | grep ^Fedora
}
