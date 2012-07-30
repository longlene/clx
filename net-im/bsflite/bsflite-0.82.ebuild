# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lightweight, command-line AIM client"
HOMEPAGE="http://bsflite.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

DEPEND=""

MAKEOPTS="INSTALL_PREFIX=$DESTTREE INSTALL=install $MAKEOPTS"

src_install() {
	dobin ${PN} || die "dobin failed"
	dodoc ChangeLog COPYING README config-example
	doman ${PN}.1
}
