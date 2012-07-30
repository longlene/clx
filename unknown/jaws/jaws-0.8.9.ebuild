# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php depend.apache

DESCRIPTION="JAWS, the Content Management System and Framework for building dynamic web sites."
HOMEPAGE="http://www.jaws-project.com/"
SRC_URI="http://bits.jaws-project.com/releases/jaws-${PV}/jaws-complete-${PV}.tar.gz"

LICENSE="LGPL-2.1 GPL-2"
KEYWORDS="~x86"
IUSE=""
SLOT="0"

RDEPEND="virtual/httpd-cgi"

need_php_httpd
want_apache

pkg_setup() {
	if ! PHPCHECKNODIE="yes" require_php_with_use xml || \
		! PHPCHECKNODIE="yes" require_php_with_any_use mysql mysqli postgres ; then
			die "Re-install ${PHP_PKG} with xml and at least one of mysql mysqli postgres in USE."
	fi
	webapp_pkg_setup
}

src_install () {
	webapp_src_preinst

	cp -R html/* "${D}"/${MY_HTDOCSDIR}

	dodoc AUTHORS BETA_TESTING Changelog GPL INSTALL INSTALL_SVN LGPL README THANKS UPGRADING

	webapp_serverowned "${MY_HTDOCSDIR}/config"
	webapp_serverowned "${MY_HTDOCSDIR}/data"
	webapp_serverowned "${MY_HTDOCSDIR}/data/logs"
	webapp_serverowned "${MY_HTDOCSDIR}/data/themes"

	webapp_configfile ${MY_HTDOCSDIR}/config/JawsConfig.php.sample
	webapp_src_install
}
