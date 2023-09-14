# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="The optimizing Quil compiler"
HOMEPAGE="https://github.com/quil-lang/quilc"
SRC_URI="https://github.com/quil-lang/quilc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/command-line-arguments
	dev-lisp/yason
	dev-lisp/magicl
	dev-lisp/hunchentoot
	dev-lisp/bordeaux-threads
	dev-lisp/cl-syslog
	dev-lisp/rpcq
	dev-lisp/cl-yacc
	dev-lisp/alexandria
	dev-lisp/parse-float
	dev-lisp/cl-grnm
	dev-lisp/singleton-classes
	dev-lisp/abstract-classes
	dev-lisp/closer-mop
	dev-lisp/optima
	dev-lisp/cl-algebraic-data-type
	dev-lisp/global-vars
	dev-lisp/salza2
	dev-lisp/cl-permutation
	dev-lisp/queues
	dev-lisp/trivial-benchmark
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd cl-quil-tests.asd app/tests tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION.txt
}
