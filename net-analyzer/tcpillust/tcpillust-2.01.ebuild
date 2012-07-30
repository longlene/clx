# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="A graphical TCP connection analysis tool"
HOMEPAGE="http://www.nishida.org/tcpillust/"
SRC_URI="http://www.nishida.org/tcpillust/tcpillust-2.01.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
DEPEND="dev-lang/tcl
	dev-lang/tk
	x11-misc/imake"
RDEPEND="dev-lang/tcl
	dev-lang/tk"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}"/${P}-dynamic_tcltk.patch
	eautoreconf
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install install.man || die "Install failed!"
}
