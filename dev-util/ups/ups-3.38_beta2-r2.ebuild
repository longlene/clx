# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator
MY_PV=$(replace_version_separator 2 '-')

DESCRIPTION="Light C, C++, and Fortran debugger under X11."
SRC_URI="mirror://sourceforge/ups/${PN}-${MY_PV}.tar.gz"
HOMEPAGE="http://ups.sourceforge.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"
DEPEND="virtual/x11"
S=${WORKDIR}/${PN}-${MY_PV}

src_compile() {

	myconf="--prefix=${D}usr"
	
	if use debug; then
		myconf="${myconf} --enable-debug"
		RESTRICT="${RESTRICT} nostrip"
	fi

#	Using configure as econf does not set prefix correctly
	./configure ${myconf}
	emake || die "emake failed"
}


src_install() {

	make DESTDIR="${D}" install || die "install failed"

	dodoc BUGS CHANGES FAQ
}
