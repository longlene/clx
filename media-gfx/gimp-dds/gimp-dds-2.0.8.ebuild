# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="DirectDraw Surface (DDS) format plugin for Gimp 2"
SRC_URI="http://nifelheim.dyndns.org/~cocidius/files/${P}.tar.bz2"
HOMEPAGE="http://nifelheim.dyndns.org/~cocidius/dds/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-gfx/gimp-2.6"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -i \
		-e "s:^CFLAGS=.*:CFLAGS=${CFLAGS} \$(shell pkg-config --cflags gtk+-2.0 gimp-2.0):" \
		-e "s:^LDFLAGS=.*:LDFLAGS=${LDFLAGS}:" \
		Makefile.linux || die
}

src_install() {
	exeinto "$(pkg-config --variable=gimplibdir gimp-2.0)/plug-ins"
	doexe dds || die "Installation failed"
	dodoc README TODO doc/gimp-dds.pdf
}
