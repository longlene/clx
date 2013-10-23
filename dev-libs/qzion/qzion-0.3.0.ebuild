# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit qt4-r2

DESCRIPTION="QZion is an canvas abstraction used by and made for QEdje."
HOMEPAGE="http://dev.openbossa.org/trac/qedje"
SRC_URI="http://dev.openbossa.org/qedje/downloads/source/qzion/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~x86"
SLOT="0"
IUSE="doc"

DEPEND="x11-libs/qt-core
	x11-libs/qt-gui
	x11-libs/qt-webkit
	doc? ( app-doc/doxygen )"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake4 "${PN}.pro" "QMAKE_STRIP-=strip" "PREFIX=/usr"
	emake || die "make failed"

	# docs
	if use doc; then
		cd "${S}/src"
		sed -i 's/GENERATE_LATEX         = YES/GENERATE_LATEX         = NO/' \
        	doxyfile
		doxygen doxyfile
	fi
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "make install failed"

	# docs
	if use doc; then
		dohtml -r doc/html/*
	fi
	dodoc README
}
