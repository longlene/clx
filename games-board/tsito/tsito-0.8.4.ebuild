# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Console based Chinese chess interface"
HOMEPAGE="http://xiangqi-engine.sourceforge.net/"
SRC_URI="mirror://sourceforge/xiangqi-engine/${P}.tar.gz"

KEYWORDS="~x86"
LICENSE="MIT"
SLOT="0"

src_unpack() {
	unpack ${A}
}

src_install () {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS COPYING ChangeLog NEWS TODO README
	doman doc/${PN}.1
	prepgamesdirs
}
