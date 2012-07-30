# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV=${PV/./}

DESCRIPTION="PVS (Potentially Visible Set) builder specially designed to be used with OpenGL ports of the DOOM game engine."
HOMEPAGE="http://www.vavoom-engine.com/glvis.php"
SRC_URI="mirror://sourceforge/vavoom/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

src_unpack() {
		unpack ${A} || die "unpack failed"
}

src_compile() {
	econf $(use_enable debug) || die "configure failed"
	emake || die "emake failed"
}

src_install() {
		dobin ${PN} || die "dobin failed"
		dodoc ${PN}.txt
}
