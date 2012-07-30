# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="OrangeHRM is an Open Source Humand Resource Management System"
HOMEPAGE="http://orangehrm.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

need_httpd_cgi
need_php_httpd

pkg_setup() {
	webapp_pkg_setup

}

src_install() {
	webapp_src_preinst
	rm .project
	mv license/3rdParty/* license
	rm -rf license/3rdParty
	local docs="CHANGELOG.TXT README.TXT new_changed_features.txt"
	local license="license/*"
	local htmldocs="INSTALL.html faq.html ${WORKDIR}/orangehrm-quick-start-guide.html"
	dodoc ${docs}
	rm -f $docs
	dodoc ${license}
	dohtml ${htmldocs}
	rm -f ${htmldocs}
	#dohtml -r installer/guide installer/images
	insinto "${MY_HTDOCSDIR}"
	touch installer/log.txt
	doins -r .
		
	webapp_configfile "${MY_HTDOCSDIR}"/lib/confs/Conf-auto.php
	webapp_configfile "${MY_HTDOCSDIR}"/lib/confs/cryptokeys/key.ohrm
	webapp_configfile "${MY_HTDOCSDIR}"/lib/confs/sysConf.php
	webapp_serverowned "${MY_HTDOCSDIR}"/installer/log.txt
	webapp_serverowned "${MY_HTDOCSDIR}"/lib/confs
	webapp_serverowned "${MY_HTDOCSDIR}"/lib/confs/Conf-auto.php
	webapp_serverowned "${MY_HTDOCSDIR}"/lib/confs/sysConf.php
	
	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt

	webapp_src_install
}

