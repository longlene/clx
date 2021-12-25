# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A helper to simplify command line arguments usage in Common Lisp"
HOMEPAGE="https://github.com/40ants/defmain"
SRC_URI="https://github.com/40ants/defmain/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clon
	dev-lisp/alexandria
	dev-lisp/cl-strings
"
BDEPEND=""

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr README.rst
}
