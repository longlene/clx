# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8

inherit eutils

DESCRIPTION="Radiance HDR save/load plugin for Gimp 2"
HOMEPAGE="http://nifelheim.dyndns.org/~cocidius/hdrtools/"
SRC_URI="http://nifelheim.dyndns.org/~cocidius/files/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-gfx/gimp:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="README"

src_prepare() {
	sed -i Makefile \
		-e '/^CC=/d' \
		-e '/^CFLAGS=/{s/=/:=/ ; s/-g -O2/$(CFLAGS)/}' \
		-e '/^LD=/s/gcc/$(CC)/' \
		-e '/^LDFLAGS=/d' \
		|| die
}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe hdrtools || die
	dodoc ${DOCS} || die
}
