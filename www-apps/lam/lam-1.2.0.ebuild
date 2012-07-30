# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="PHP based tool for managing various account types (Unix, Samba, Kolab, ...) in an LDAP directory."
SRC_URI="mirror://sourceforge/${PN}/ldap-account-manager-${PV}.tar.gz"
HOMEPAGE="http://lam.sourceforge.net/"

LICENSE="GPL-2+"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc"
S=${WORKDIR}/ldap-account-manager-${PV}

IUSE="lamdaemon"

RDEPEND="lamdaemon? ( dev-lang/perl net-libs/libssh2 )
	virtual/httpd-php
	net-www/apache"

pkg_setup () {
	webapp_pkg_setup
	if has_version 'dev-lang/php' ; then
		require_php_with_use xml ldap mhash
	fi
}

src_unpack() {
	unpack ${A}
	cd ${S}/config
	mv config.cfg_sample config.cfg
	mv lam.conf_sample lam.conf
	rm ${S}/{configure,install.sh,Makefile.in}
}

src_install () {
	webapp_src_preinst

	DOCFILES="COPYING copyright HISTORY INSTALL README TODO VERSION"

	dodoc ${DOCFILES}
	dodoc docs/*.txt
	dohtml -r doc/devel

	rm -f ${DOCFILES}

	cp -R * ${D}/${MY_HTDOCSDIR}

	webapp_configfile ${MY_HTDOCSDIR}/config/config.cfg
	webapp_configfile ${MY_HTDOCSDIR}/config/lam.conf

	webapp_serverowned ${MY_HTDOCSDIR}/sess
	webapp_serverowned ${MY_HTDOCSDIR}/tmp

	webapp_src_install
}
