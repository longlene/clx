# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit flag-o-matic

DESCRIPTION="Implementation of AVL trees for C"
HOMEPAGE="http://libavl.sourcearchive.com"
SRC_URI="http://libavl.sourcearchive.com/downloads/${PV}/libavl_${PV}.orig.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_compile() {
        append-flags "-fPIC"
	emake || die "emake failed"
}

src_install() {
	dolib libavl.so.1.5 || die
	dosym libavl.so.1.5 /usr/lib/libavl.so || die
	dodoc README || die
	insinto /usr/include
	doins avl.h || die
}
