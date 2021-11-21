# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a7f904784ae59bbeeeb15a14348cda46ed9bdeb3"

DESCRIPTION="Exploratory programming environment and documentation generator"
HOMEPAGE="https://github.com/melisgl/mgl-pax"
SRC_URI="https://github.com/melisgl/mgl-pax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3bmd
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-fad
	dev-lisp/colorize
	dev-lisp/ironclad
	dev-lisp/named-readtables
	dev-lisp/pythonic-string-reader
	app-emacs/slime
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test
}
	
