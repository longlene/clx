# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86"
DESCRIPTION="A gravity simulator using the Barnes-Hut N-Body algorithm."
SRC_URI="http://gravit.slowchop.com/dist/${P}-src.tgz"
HOMEPAGE="http://gravit.slowchop.com/"
DEPEND=">=media-libs/libsdl-1.2"
RDEPEND=">=media-libs/libsdl-1.2"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

src_compile() {
	econf
	emake
}

src_install() {
	make DESTDIR="${D}" install
}
