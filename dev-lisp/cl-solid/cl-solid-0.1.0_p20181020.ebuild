# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e389fceca0e283a05003ef070e07efaa1f8886e"

DESCRIPTION="A Solid library for common lisp"
HOMEPAGE="https://github.com/gibsonf1/cl-solid"
SRC_URI="https://github.com/gibsonf1/cl-solid/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/lack
	dev-lisp/caveman2
	dev-lisp/envy
	dev-lisp/cl-ppcre
	dev-lisp/uiop
	dev-lisp/cl-syntax-annot
	dev-lisp/djula
	dev-lisp/datafly
	dev-lisp/sxql
	dev-lisp/clath
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static templates
}
