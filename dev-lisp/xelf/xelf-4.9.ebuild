# Copyright 2008-2017 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 elisp-common vcs-snapshot

DESCRIPTION="XELF is a visual programming language for Common Lisp"
HOMEPAGE="http://xelf.me/"
SRC_URI="http://xelf.me/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="emacs example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-image
	dev-lisp/lispbuilder-sdl-ttf
	dev-lisp/lispbuilder-sdl-mixer
	dev-lisp/uuid
	dev-lisp/babel
	dev-lisp/salza2
	dev-lisp/chipz
	dev-lisp/usocket
	dev-lisp/cl-fad
	dev-lisp/cl-opengl
"

src_install() {
	common-lisp-install-sources -t all *.lisp standard
	common-lisp-install-one-asdf xelf.asd
	if use example ; then
		common-lisp-install-sources -t all plong/{ball.png,bip.wav,package.lisp,paddle.png,plong.lisp}
		common-lisp-install-one-asdf plong/plong.asd
	fi

	use emacs && elisp-install ${PN} xelf.el
	dodoc -r README build doc notes
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}

