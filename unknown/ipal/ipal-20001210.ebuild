# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib eutils

DESCRIPTION="Icarus PAL"
HOMEPAGE="http://www.icarus.com/eda/ipal/index.html"
SRC_URI="ftp://icarus.com/pub/eda/ipal/snapshots/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	econf || die "./configure failed"
	emake || die "emake failed"
}

src_install() {
	make \
		prefix=${D}/usr \
		mandir=${D}/usr/share/man \
		infodir=${D}/usr/share/info \
		libdir=${D}/usr/$(get_libdir) \
		libdir64=${D}/usr/$(get_libdir) \
		vpidir=${D}/usr/$(get_libdir)/ivl \
		includedir=${D}/usr/include \
		datadir=${D}/usr/share \
		install || die "make install failed" 

	dodoc *.txt COPYING INSTALL html/*
}
