# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/owncloud/owncloud-1.2.ebuild,v 1.1 2011/04/27 12:10:20 alexxy Exp $

inherit webapp eutils depend.php

MY_PV=${PV:0:3}.0

DESCRIPTION="Web-based storage application where all your data is under your own control"
HOMEPAGE="http://owncloud.org"
SRC_URI="http://owncloud.org/releases/${P}.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

need_httpd_cgi
need_php_httpd

S="${WORKDIR}/${P/_/-}"

pkg_setup() {
	flags="json xmlwriter zip"
	webapp_pkg_setup
	has_php
	require_php_with_use ${flags}
}

src_install() {
	cd owncloud
	webapp_src_preinst

	local docs="README docs/*"
	dodoc ${docs}
	rm -f ${docs}
	insinto "${MY_HTDOCSDIR}"
	doins -r .
	dodir "${MY_HTDOCSDIR}"/data
	webapp_serverowned "${MY_HTDOCSDIR}"/data
	webapp_serverowned "${MY_HTDOCSDIR}"/config

	webapp_src_install
}
