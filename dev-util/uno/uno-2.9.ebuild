# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV=${PV/./}
DESCRIPTION="A simple tool for source code analysis"
HOMEPAGE="http://spinroot.com/uno"
SRC_URI="http://spinroot.com/uno/uno_v${MY_PV}.tar.gz"
S=${WORKDIR}/${PN}

LICENSE="Open Source"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	cd ${S}/src
	emake || die
}

src_install() {
	cd ${S}/src
	dobin uno
	dobin uno_local
	dobin uno_global
}
