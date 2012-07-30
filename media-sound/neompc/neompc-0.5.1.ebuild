# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils webapp depend.php

DESCRIPTION="A web based MPD Client"
HOMEPAGE="http://www.pixelhum.com/neompc/"
SRC_URI="http://neompc.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="gd"

DEPEND="virtual/httpd-php
	media-sound/mpd
	gd? ( media-libs/gd )"

need_php

pkg_setup() {
	webapp_pkg_setup

	use gd && require_gd
}

src_install() {
	webapp_src_preinst

	cp -R * "${D}"${MY_HTDOCSDIR}
	webapp_serverowned -R ${MY_HTDOCSDIR}/imagecache
	webapp_serverowned -R ${MY_HTDOCSDIR}/smarty/templates_c
	webapp_configfile ${MY_HTDOCSDIR}/config/config.inc.php

	webapp_src_install
}

pkg_postinst() {
	elog ""
	elog "Instructions for ${P}:"
	elog "You may have to turn off Safe Mode in your php.ini in order to get this app working"
	elog ""
	elog "Config file can be found from: ${ROOT}${VHOST_ROOT}/${MY_HTDOCSBASE}/${PN}/config/config.inc.php"
	elog ""
}

