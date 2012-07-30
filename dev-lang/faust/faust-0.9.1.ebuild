# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio plugins and applications development. The Faust compiler translates signal processing specifications into C++ code."
HOMEPAGE="http://faudiostream.sourceforge.net"
SRC_URI="mirror://sourceforge/faudiostream/${P}.src.tgz"

RDEPEND="sys-devel/bison
		 sys-devel/flex"
DEPEND="sys-apps/sed"

S=${WORKDIR}/${PN}
src_unpack() {
	unpack ${A}
}

src_compile() {
	sed -i "s\/usr/local\ ${D}/usr\ " Makefile
	emake || die "parallel make failed"
}

src_install() {
	dodir ${D}/usr/lib/faust
	make install DESTDIR=${D}
	dodoc README 
	install faust_tutorial.pdf ${D}/usr/share/doc/${P}
}
