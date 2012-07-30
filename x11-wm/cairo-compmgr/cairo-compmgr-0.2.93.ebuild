# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools eutils gnome2

DESCRIPTION="A versatile and extensible composite manager which uses cairo for rendering"
HOMEPAGE="http://cairo-compmgr.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/ccm/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE="glitz"

RDEPEND=">=x11-libs/gtk+-2.10
	glitz? ( >=media-libs/glitz-0.5.7
		x11-libs/cairo[glitz]
	)
	|| (
		( =x11-libs/cairo-1.8* >=x11-libs/pixman-0.12 )
		( =x11-libs/cairo-1.6* >=x11-libs/pixman-0.10 )
	)
	>=x11-proto/glproto-1.4.9"
DEPEND="${RDEPEND}"

pkg_setup() {
	G2CONF="$(use_enable glitz) --disable-glitz-tfp --enable-shave"
}

src_prepare() {
	epatch "${FILESDIR}/${P}-glitz-tfp-undef.patch"
	epatch "${FILESDIR}/${P}-glitz-code.patch"
	AT_M4DIR="." eautoreconf
}
