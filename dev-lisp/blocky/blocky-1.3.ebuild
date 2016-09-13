# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-3 vcs-snapshot elisp-common

DESCRIPTION="BLOCKY is a visual programming language for Common Lisp."
HOMEPAGE="http://blocky.io/"
SRC_URI="https://github.com/dto/blocky/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="emacs"

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/lispbuilder-sdl
		dev-lisp/lispbuilder-sdl-image
		dev-lisp/lispbuilder-sdl-ttf
		dev-lisp/lispbuilder-sdl-mixer
		dev-lisp/uuid
		dev-lisp/cl-fad
		dev-lisp/cl-opengl
		emacs? ( virtual/emacs )"

#CLSYSTEMS=""
#src_unpack() {
#	unpack ${A}
#	mv *-${PN}-* "${S}"
#}

src_install() {
	common-lisp-install ${PN}.asd *.lisp standard old
	common-lisp-symlink-asdf

	dodoc COPYING CREDITS INSTALL *.org *.txt

	if use emacs; then
		elisp-install ${PN} *.el
	fi
}

pkg_postinst() {
	if use emacs; then
		elisp-site-regen
	fi
}

pkg_postrm() {
	if use emacs; then
		elisp-site-regen
	fi
}
