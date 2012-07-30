# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

ESVN_REPO_URI="https://www.secure-computing.net/svn/trunk/ssl-admin/@34"

DESCRIPTION="ssl-admin is a tool designed to simplify the management and distribution of SSL certificates"
HOMEPAGE="http://www.secure-computing.net/ssl-admin"

LICENSE="BSD-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="app-arch/zip"
DEPEND="${RDEPEND}"

src_compile() {
	true
}

src_install(){

	sed -e "s+~~~ETCDIR~~~+/etc+g" -i ssl-admin* openssl.conf man1/* man5/* || die "failed to correct path in files"

	insinto /etc/ssl-admin/
	doins {openssl,ssl-admin}.conf || die "could not install files in /etc"
	fowners root:wheel /etc/ssl-admin/openssl.conf
	fowners root:wheel /etc/ssl-admin/ssl-admin.conf
	fperms 660 /etc/ssl-admin/openssl.conf /etc/ssl-admin/ssl-admin.conf

	dobin ssl-admin || die "could not install ssl-admin"
	fowners root:wheel /usr/bin/ssl-admin
	doman man1/ssl-admin.1 man5/ssl-admin.conf.5 || die "man page installation failed"
}

