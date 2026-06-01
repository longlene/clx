# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 elisp

DESCRIPTION="Interactive Common Lisp: an enhanced REPL"
HOMEPAGE="https://github.com/atgreen/icl"
SRC_URI="https://github.com/atgreen/icl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	app-emacs/sly
	dev-lisp/clingon
	dev-lisp/version-string
	dev-lisp/termp
	dev-lisp/cffi
	dev-lisp/slynk-client
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/yason
	dev-lisp/jzon
	dev-lisp/tuition
	dev-lisp/hunchentoot
	dev-lisp/hunchensocket
	dev-lisp/chanl
	dev-lisp/zip
	dev-lisp/flexi-streams
	dev-lisp/osicat
"

src_compile() {
	elisp-compile *.el
}

src_install() {
	common-lisp-install-sources src
	common-lisp-install-asdf ${PN}.asd
	elisp-install *.{el,elc}
}
