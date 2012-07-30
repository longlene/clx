# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit  toolchain-funcs

DESCRIPTION="Optimizing brainfuck compiler written in brainfuck for Linux on i386."
HOMEPAGE="http://www.nada.kth.se/~matslina/awib/"
SRC_URI="http://www.helch.ch/gentoo/distfiles/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	$(tc-getCC) ${CFLAGS} -o awib awib.c || die "awib compile failed!"
	$(tc-getCC) ${CFLAGS} -o wib wib.c || die "wib compile failed!"
}

src_install() {
	dobin awib wib
	dodoc awib.b wib.b
}
