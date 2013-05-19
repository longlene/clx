# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg

MY_P="jdic-${PV}-bin-linux"
S="${WORKDIR}/${MY_P}"

DESCRIPTION=" The JDesktop Integration Components (JDIC)"
HOMEPAGE="https://jdic.dev.java.net/"
SRC_URI="https://jdic.dev.java.net/files/documents/880/4740/${MY_P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~ppc"
IUSE="doc"
RDEPEND=">=virtual/jre-1.4.2"

src_compile() {
	einfo "Binary ebuild only for now"
}

src_install() {
	java-pkg_dojar jdic.jar
	
	dolib libjdic.so
	dobin mozembed-linux-gtk2

	dodoc README.html COPYING 

	if use doc; then
		einfo "Installing documentation..."
		dohtml -r javadoc/*
		insinto /usr/share/doc/${P}/examples/
		doins demo/*
		local dirs="Browser FileChooser FileExplorer FileTypes SimpleBrowser"

		for i in $dirs; do
			insinto /usr/share/doc/${P}/examples/$i
			doins demo/$i/*
		done
	fi
}
