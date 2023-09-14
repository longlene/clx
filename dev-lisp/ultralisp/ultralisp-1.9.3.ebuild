# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="The software behind a Ultralisp.org Common Lisp repository"
HOMEPAGE="https://ultralisp.org/"
SRC_URI="https://github.com/ultralisp/ultralisp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-interpol
	dev-lisp/weblocks-ui
	test? ( dev-lisp/hamcrest )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
	rm -r packages-extractor.asd app.asd app-deps.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all ChangeLog.rst
}
