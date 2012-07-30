# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit eutils webapp depend.php

DESCRIPTION="web-based collaboration platform last called is opengoo"
HOMEPAGE="http://www.fengoffice.com/"
SRC_URI="mirror://sourceforge/opengoo/${PN}_1.7.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/httpd-php
	|| ( <dev-lang/php-5.3[gd,mysql,simplexml] >=dev-lang/php-5.3 )"

src_prepare() {
true;
}

src_install() {
	webapp_src_preinst
	cp -R fengoffice/* "${D}/${MY_HTDOCSDIR}"
#	mv "${D}"/fengoffice/config/empty.config.php "${D}/${MY_HTDOCSDIR}"/fengoffice/config.php
#	mv "${D}/${MY_HTDOCSDIR}"/fengoffice/config/empty.config.php "${D}/${MY_HTDOCSDIR}"/fengoffice/config/config.php
#mv "${MY_HTDOCSDIR}/config/empty.config.php" "${MY_HTDOCSDIR}/config/config.php"
#	webapp_configfile "${MY_HTDOCSDIR}/config/config.php"
	webapp_serverowned "${MY_HTDOCSDIR}"/upload
	webapp_serverowned "${MY_HTDOCSDIR}"/config
	webapp_serverowned "${MY_HTDOCSDIR}"/tmp
	webapp_src_install
}
