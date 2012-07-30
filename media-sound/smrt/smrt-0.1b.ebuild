# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A powerful command-line tool that eases the process of renaming and \
tagging MP3 and Ogg files."
HOMEPAGE="http://smrt.longstair.com"
SRC_URI="http://${PN/b/}.longstair.com/files/${P/b/}.tbz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="db"

DEPEND=""
RDEPEND=""
S="${WORKDIR}/${PN/b/}"

src_install() {
	cd ${S}
	
	insinto /usr/share/${PN}
	doins -r classes util

	dodoc README.html TODO

	exeinto /usr/share/${PN}
	doexe smrt

	if use db; then doins musicdb.sqlite; fi
	
	make_wrapper ${PN/b/} ${PN/b/} /usr/share/${PN}
}
