# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
WX_GTK_VER="2.9"

inherit scons-utils wxwidgets

DESCRIPTION="Photo filter, striking colour pops in seconds"
HOMEPAGE="http://www.indii.org/software/tintii"
SRC_URI="mirror://sourceforge/tint/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RDEPEND="x11-libs/wxGTK:${WX_GTK_VER}[X]"
DEPEND="${RDEPEND}
	dev-libs/boost
	doc? ( app-doc/doxygen )"

src_compile() {
	escons || die

	if use doc ; then
		doxygen Doxyfile || die
	fi;
}

src_install() {
	dobin ${PN} || die

	dodoc README.txt || die
	if use doc ; then
		dohtml srcdocs/html/* || die
	fi;
}
