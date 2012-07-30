# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs
DESCRIPTION="a Simple Machine Language interpreter"
HOMEPAGE="http://www.lost-habit.com/sml/"
SRC_URI="http://www.lost-habit.com/sml/${PN}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
S=${WORKDIR}/${PN}

src_compile() {
	tc-getCC sml.c -o sml || die Error compiling
}

src_install() {
	dobin sml
	dodoc sml.html add.txt bitmove.txt divide.txt max.txt
}
