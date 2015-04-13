# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-2

DESCRIPTION="Lisp Application Builder Interface to sdl-mixer"
HOMEPAGE="http://code.google.com/p/lispbuilder/"
SRC_URI="http://lispbuilder.googlecode.com/files/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/lispbuilder-sdl
		dev-lisp/cffi
		media-libs/sdl-mixer"

#S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	mv *${PN}* "${S}"
}

src_install() {
	common-lisp-install ${PN}.asd ${PN}-binaries.asd ${PN}-cffi.asd bin build cffi sdl-mixer
	dodoc documentation/{COPYING,CONTRIBUTORS,README}
	dohtml documentation/*.html
}

