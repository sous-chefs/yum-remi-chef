@test "install a package" {
    yum install -y php
}

@test "verify expected version" {
    php --version | grep "^PHP"
}
