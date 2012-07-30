# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp eutils depend.php

DESCRIPTION="PHP-based web interface to syslog and other network event data"
HOMEPAGE="http://loganalyzer.adiscon.com/"
SRC_URI="http://download.adiscon.com/loganalyzer/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

need_php_httpd

src_install() {
	webapp_src_preinst

	dodoc "ChangeLog" "INSTALL" || die

	touch src/config.php
	insinto "${MY_HTDOCSDIR}"
	doins -r src/*

	webapp_configfile "${MY_HTDOCSDIR}"/config.php

	webapp_src_install
}
