# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit webapp eutils

MY_PN="WebsiteBaker"

DESCRIPTION="The most easy CMS in the world that will allow you to create a website within minutes."
HOMEPAGE="http://www.websitebaker2.org/"
SRC_URI="http://www.websitebaker2.org/media/download_gallery/${MY_PN}_${PV}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="virtual/httpd-cgi
        virtual/php"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

pkg_setup () {
  webapp_pkg_setup
  require_php_with_use mysql
}


src_install() {
        webapp_src_preinst
        dodoc CHANGELOG COPYING README
        cp -R ./wb/* "${D}/${MY_HTDOCSDIR}"
        rm -rf "${D}/${MY_HTDOCSDIR}/CHANGELOG" "${D}/${MY_HTDOCSDIR}/COPYING" "${D}/${MY_HTDOCSDIR}/README" "${D}/${MY_HTDOCSDIR}/LICENSE" "${D}/${MY_HTDOCSDIR}/wb/htaccess.txt"

        webapp_serverowned -R "${MY_HTDOCSDIR}/pages"
        webapp_serverowned -R "${MY_HTDOCSDIR}/languages"
        webapp_serverowned -R "${MY_HTDOCSDIR}/media"
        webapp_serverowned -R "${MY_HTDOCSDIR}/modules"
        webapp_serverowned -R "${MY_HTDOCSDIR}/temp"
        webapp_serverowned -R "${MY_HTDOCSDIR}/templates"
        webapp_postinst_txt en "${WORKDIR}/INSTALL"
        webapp_configfile ${MY_HTDOCSDIR}/config.php
        webapp_src_install
}

