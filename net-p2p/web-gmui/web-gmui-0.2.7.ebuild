# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

DESCRIPTION="Web-GMUI is a multiuser webfrontend for mldonkey written in PHP."
HOMEPAGE="http://web-gmui.sourceforge.net/"
SRC_URI="mirror://sourceforge/web-gmui/${P}.tar.gz"
RESTRICT="nomirror"
LICENSE="GPL-2"
KEYWORDS="~x86"
DEPEND=""
RDEPEND="|| ( dev-db/mysql dev-db/sqlite )
		>=virtual/php-4.3.2
		>=net-p2p/mldonkey-2.7.0"
IUSE=""

src_compile() {
	cp conf/config.php.sample conf/config.php
	cp bin/startup.sh.sample bin/startup.sh
	
	# fixing permissions from tar.gz file
	find . -type f -exec chmod o+r '{}' \;
}

src_install() {
	webapp_src_preinst

	dodoc ${S}/docs/*
	rm -rf ${S}/docs/

	einfo "Installing main files"
	cp -r . "${D}${MY_HTDOCSDIR}"

	webapp_configfile ${MY_HTDOCSDIR}/conf/config.php
	webapp_configfile ${MY_HTDOCSDIR}/bin/startup.sh

	webapp_src_install
}
