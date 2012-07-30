# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit php-pear-r1 depend.php

DESCRIPTION="Turn PHP scripts into Linux daemons"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"
IUSE="minimal"

RDEPEND="!minimal? ( dev-php/PEAR-Log )"

pkg_setup() {
        require_php_with_use cli pcntl posix
}