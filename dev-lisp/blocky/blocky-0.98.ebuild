# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-2

DESCRIPTION="BLOCKY is a visual programming language for Common Lisp."
HOMEPAGE="http://blocky.io/"
SRC_URI="https://github.com/dto/blocky/tarball/master -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/lispbuilder-sdl
		dev-lisp/lispbuilder-sdl-image
		dev-lisp/lispbuilder-sdl-ttf
		dev-lisp/lispbuilder-sdl-mixer
		dev-lisp/uuid
		dev-lisp/cl-fad
		dev-lisp/cl-opengl"

#CLSYSTEMS=""
src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

src_install() {
	common-lisp-install ${PN}.asd *.lisp standard testing turtle vomac
	dodoc COPYING CREDITS INSTALL *.org

}
