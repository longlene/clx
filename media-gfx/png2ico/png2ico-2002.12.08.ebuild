# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs versionator

MY_PV=$(replace_all_version_separators '-')

DESCRIPTION="PNG to icon converter"
HOMEPAGE="http://winterdrache.de/freeware/png2ico/index.html"
SRC_URI="http://winterdrache.de/freeware/png2ico/data/png2ico-src-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/libpng
	sys-libs/zlib"

src_compile() {
	cd ${PN}
	sed -i -e 's/g++/$(CXX)/' Makefile || die "sed Makefile failed"
	emake CXX=$(tc-getCXX) CPPFLAGS="${CXXFLAGS}" all
}

src_install() {
	cd ${PN}
	dobin png2ico || die
	dodoc README README.unix doc/bmp.txt || die
	doman doc/png2ico.1 || die
}
