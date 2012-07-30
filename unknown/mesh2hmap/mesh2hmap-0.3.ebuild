# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


DESCRIPTION="command line tool for converting 3D meshes into heightmaps"
HOMEPAGE="http://mesh2hmap.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""


src_unpack() {
	unpack ${A}
}

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR=${D} install || die "install failed"
	dodoc BUGS COPYING ChangeLog INSTALL README SUPPORT THANKS TODO monkey.wrl
}
