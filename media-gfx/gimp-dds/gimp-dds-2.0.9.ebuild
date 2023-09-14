# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="DirectDraw Surface (DDS) format plugin for Gimp 2"
HOMEPAGE="http://nifelheim.dyndns.org/~cocidius/dds/"
SRC_URI="http://nifelheim.dyndns.org/~cocidius/files/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-gfx/gimp:2
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="README doc/gimp-dds.pdf"

src_prepare() {
	sed -i Makefile.linux \
		-e '/^CC=/d' \
		-e '/^CFLAGS=/{s/=/:=/ ; s/-pipe -g -O2/$(CFLAGS)/}' \
		-e '/^LD=/s/gcc/$(CC)/' \
		-e '/^LDFLAGS=/d' \
		|| die
}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe dds || die
	dodoc ${DOCS} || die
}
