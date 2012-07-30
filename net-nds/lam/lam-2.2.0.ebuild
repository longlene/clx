# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

MY_P="ldap-account-manager-${PV}"
DESCRIPTION="LDAP Account Manager (LAM) is a webfrontend for managing accounts
stored in an LDAP directory."
HOMEPAGE="http://lam.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc x86"
IUSE=""
S=${WORKDIR}/${MY_P}

need_php

pkg_setup() {
	webapp_pkg_setup
	require_php_with_use ldap pcre session xml nls
}

src_unpack() {
	unpack ${A}
	cd ${S}
	mv config/config.cfg_sample config/config.cfg
	mv config/lam.conf_sample config/lam.conf
	rm ${S}/{configure,install.sh,Makefile.in}
}

src_compile() {
	touch .compiled
}

src_install() {
	webapp_src_preinst

	local docs="COPYING copyright HISTORY INSTALL README TODO VERSION"
	dodoc ${docs}
	dodoc docs/*.txt
	dohtml -r docs/devel

	einfo "Copying VERSION file"
	cp VERSION ${D}${MY_HTDOCSDIR}
	rm -f ${docs}

	einfo "Copying main files"
	cp -r . ${D}${MY_HTDOCSDIR}
	cd ${D}${MY_HTDOCSDIR}

	webapp_serverowned "${MY_HTDOCSDIR}"/config/config.cfg
	webapp_serverowned "${MY_HTDOCSDIR}"/config/lam.conf
	webapp_serverowned "${MY_HTDOCSDIR}"/sess
	webapp_serverowned "${MY_HTDOCSDIR}"/tmp
	webapp_serverowned "${MY_HTDOCSDIR}"/config
	webapp_serverowned "${MY_HTDOCSDIR}"/lib

	webapp_configfile "${MY_HTDOCSDIR}"/config/config.cfg
	webapp_configfile "${MY_HTDOCSDIR}"/config/lam.conf

	webapp_postinst_txt en ${FILESDIR}/postinstall-en.txt

	webapp_src_install
}

