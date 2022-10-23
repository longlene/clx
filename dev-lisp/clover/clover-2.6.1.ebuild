# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Simple Automated Theorem Prover"
HOMEPAGE="https://github.com/moratori/clover"
SRC_URI="https://github.com/moratori/clover/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cpus
	dev-lisp/cl-heap
	dev-lisp/lparallel
	dev-lisp/cl-yacc
	dev-lisp/lexer
	dev-lisp/generators
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/cl-custom-hash-table
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
