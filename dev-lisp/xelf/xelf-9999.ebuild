# Copyright 2008-2016 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3 elisp-common

DESCRIPTION="XELF is a visual programming language for Common Lisp"
HOMEPAGE="http://xelf.me/"
SRC_URI=""

#EGIT_REPO_URI="https://github.com/dto/xelf.git"
EGIT_REPO_URI="https://gitlab.com/dto/xelf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="emacs"

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/lispbuilder-sdl
		dev-lisp/lispbuilder-sdl-image
		dev-lisp/lispbuilder-sdl-ttf
		dev-lisp/lispbuilder-sdl-mixer
		dev-lisp/uuid
		dev-lisp/babel
		dev-lisp/salza2
		dev-lisp/quadrille
		dev-lisp/chipz
		dev-lisp/usocket
		dev-lisp/cl-fad
		dev-lisp/cl-opengl
"

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf

	dodoc -r COPYING CREDITS INSTALL licenses/* build

	use emacs && elisp-install ${PN} *.el
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}

