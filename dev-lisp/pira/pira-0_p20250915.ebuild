# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="cef39f84cd00ee2e6049e637d7c8db234ce6efa6"

DESCRIPTION="Unofficial AWS SDK for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/pira"
SRC_URI="https://github.com/fukamachi/pira/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/smithy
	dev-lisp/dexador
	dev-lisp/quri
	dev-lisp/trivial-timeout
	dev-lisp/local-time
	dev-lisp/yason
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/assoc-utils
	dev-lisp/aws-sign4
	dev-lisp/ironclad
"
BDEPEND=""

src_prepare() {
	default
	rm -rf pira-tests.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
