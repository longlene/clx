# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="a loop-free distance-vector routing protocol"
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/babel/"
SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -e 's:/man/:/share/man/:' \
		-e '/^PREFIX/{s:=.*:= /usr:;}' -i Makefile || die
}

src_compile() {
	emake \
		CC=$(tc-getCC) \
		"CDEBUGFLAGS=${CFLAGS}" \
		all || die "build failed"
}

src_install(){
	emake "TARGET=${D}" install || die "install failed"
	dodoc CHANGES README || die
}
