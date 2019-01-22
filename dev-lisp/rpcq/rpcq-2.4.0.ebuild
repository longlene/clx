# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="The RPC framework and message specification for Rigetti QCS"
HOMEPAGE="https://github.com/rigetti/rpcq"
SRC_URI="https://github.com/rigetti/rpcq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/parse-float
	dev-lisp/yason
	dev-lisp/pzmq
	dev-lisp/cl-messagepack
	dev-lisp/bordeaux-threads
	dev-lisp/local-time
	dev-lisp/unicly
	dev-lisp/cl-syslog
	test? ( dev-lisp/fiasco )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd src-tests
}
