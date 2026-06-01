# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Command-line XMMS2 client"
HOMEPAGE="http://sirius.cine7.net/nyello/index.php"
SRC_URI="http://sirius.cine7.net/nyello/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=">=media-sound/xmms2-0.2
	sys-libs/readline"

RESTRICT="nomirror"

src_install () {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README TODO
}
