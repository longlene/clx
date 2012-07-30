# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An implementation of the TeamSpeak 2 UDP VOIP and chat protocol. It is \
implemented as a cross platform C library."
HOMEPAGE="http://sourceforge.net/projects/teambb"
SRC_URI="mirror://sourceforge/teambb/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=""

src_install() {
	make DESTDIR=${D} install || die "make install failed."
}
