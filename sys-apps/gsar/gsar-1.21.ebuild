# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

DESCRIPTION="general search and replace utility"
HOMEPAGE="http://gnuwin32.sourceforge.net/packages/gsar.htm"
MY_PV=$(replace_version_separator 1 '' )

SRC_URI="http://home.online.no/~tjaberg/${PN}${MY_PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	dobin gsar
	dodoc read.me compile.txt gsar.txt
	doman gsar.1 || die
}
