# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A shell script to set xterm-like window- and icon-name"
HOMEPAGE="http://www.cs.indiana.edu/~kinzler/xtitle/"
SRC_URI="http://www.cs.indiana.edu/~kinzler/xtitle/xtitle-1.0.0.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~x86"
IUSE=""

DEPEND="x11-misc/imake"
RDEPEND="${DEPEND}"

src_compile() {
	xmkmf || die "xmkmf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	mv "${S}/xtitle.man" "${S}/xtitle.1"
	doman "${S}/xtitle.1" || die "doman failed"
	dodoc "${S}/"{COPYING,README} || die "dodoc failed"
	dohtml "${S}/xtitle.html" || die "dohtml failed"
}
