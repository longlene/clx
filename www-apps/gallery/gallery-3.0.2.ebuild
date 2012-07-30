# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

EAPI="2"

inherit webapp eutils depend.php 

DESCRIPTION="Web based (PHP Script) photo album viewer/creator"
HOMEPAGE="http://gallery.menalto.com/"
SRC_URI="mirror://sourceforge/gallery/${P}.zip"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

# Build depend is on unzip
DEPEND="app-arch/unzip"

RDEPEND="
	>=dev-db/mysql-5
	>=dev-lang/php-5.2.3
	>=www-servers/apache-2
	"

My_PN="${PN}3"
S=${WORKDIR}/${My_PN}

need_httpd_cgi
need_php_httpd


src_install() {
	webapp_src_preinst

	INSTALL_DIR="/${My_PN}"

	cp -R * ${D}/${MY_HTDOCSDIR}

	keepdir ${MY_HTDOCSDIR}/var
	webapp_serverowned ${MY_HTDOCSDIR}/var

	ewarn "ATTANTION!"
	ewarn "gallery3 requires short_open_tag to be On"
	ewarn "You need to edit \"/etc/php/apache2-php5.?/php.ini\"" 
	ewarn "and change short_open_tag to \"On\" and "
	ewarn "re-start apache (/etc/init.d/apache2 restart)"

	webapp_src_install
}

pkg_postinst() {
	elog
	elog "To start \"gallery3\" just browse to "
	elog
	elog "http://${VHOST_HOSTNAME}/${VHOST_APPDIR}/gallery3"
	elog
	elog "and follow the simple instructions." 
	elog
	ewarn "MAKE SURE TO CHANGE YOUR ADMIN PASSWORD!"
	elog
	elog
	elog "Please read the file http://${VHOST_HOSTNAME}/${VHOST_APPDIR}/README"
	elog "for additional information."
	elog "For example, how to upgrade from gallery2 to gallery3."
	elog
	elog "For additional information refer to ${HOMEPAGE}, please."
	elog

	webapp_pkg_postinst
}

