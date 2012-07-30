# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit webapp eutils depend.php

DESCRIPTION="amaroK Web Frontend"
HOMEPAGE="http://amarokwebfront.sourceforge.net/"
SRC_URI="mirror://downloads.sourceforge.net/amarokwebfront/${P}.tar.bz2"

LICENSE="GPL-2"
IUSE="mysql postgres"

S=${WORKDIR}/${PN}

need_php

pkg_setup () {
	webapp_pkg_setup

	local php_flags
	use mysql && php_flags="${php_flags} mysql"
	use postgres && php_flags="${php_flags} postgres"
	require_php_with_use ${php_flags}
}

src_install() {
	webapp_src_preinst

	local docs="README CHANGELOG DISCLAIMER LICENSE"
	dodoc ${docs}
	rm -f ${docs} INSTALL DISCLAIMER obsidianmusic.kateprj
	rm -r daemon

	insinto "${MY_HTDOCSDIR}"
	doins -r .
	webapp_serverowned "${MY_HTDOCSDIR}"/inc/cache
	webapp_configfile  "${MY_HTDOCSDIR}"/inc/config.php
	webapp_configfile  "${MY_HTDOCSDIR}"/inc/auth.users.php

	webapp_src_install
}
