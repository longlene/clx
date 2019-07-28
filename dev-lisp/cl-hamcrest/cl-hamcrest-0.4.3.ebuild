# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A set of helpers to make your unittests more readable"
HOMEPAGE="https://github.com/40ants/cl-hamcrest"
SRC_URI="https://github.com/40ants/cl-hamcrest/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr READMe.rst
}
