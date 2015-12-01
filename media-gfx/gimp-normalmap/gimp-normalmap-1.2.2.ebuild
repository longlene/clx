# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit eutils

DESCRIPTION="Normalmap plugin for Gimp 2"
HOMEPAGE="http://nifelheim.dyndns.org/~cocidius/normalmap/"
SRC_URI="http://nifelheim.dyndns.org/~cocidius/files/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-gfx/gimp:2
	media-libs/glew
	x11-libs/gtk+:2
	x11-libs/gtkglext"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="README"

src_prepare() {
	sed -i Makefile.linux \
		-e '/^CC=/d' \
		-e '/^CFLAGS=/{s/=/:=/ ; s/-O3/$(CFLAGS)/}' \
		-e '/^LD=/s/gcc/$(CC)/' \
		-e '/^LDFLAGS=/d' \
		|| die
}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe normalmap || die
	dodoc ${DOCS} || die
}
