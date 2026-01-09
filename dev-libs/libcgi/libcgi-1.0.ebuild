# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit flag-o-matic

DESCRIPTION="A CGI library written in C"
HOMEPAGE="http://libcgi.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
# On freshmeat this is marked as LGPL. In the package itself, there is no license text.
LICENSE=""

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
#RESTRICT="strip"
# doesn't work in parallel with cgilib
DEPEND="!dev-libs/cgilib"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/Makefile.in-fix-destdir.patch"
}


# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need a different behaviour.
src_compile() {
	# have to append PIC flag manually. The configure script doesn't set
	# this automatically in version version 1.0
	append-flags -fPIC
	econf
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	mv ${S}/doc/man/man3/md5.3 ${S}/doc/man/man3/cgi_md5.3 || die
	rm ${S}/doc/man/man3/todo.3 || die
	doman doc/man/man3/*.3 || die
	dodoc doc/html/* || die
}
