# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="connection pool for CL-DBI"
HOMEPAGE="https://github.com/tamurashingo/cl-dbi-connection-pool"
SRC_URI="https://github.com/tamurashingo/cl-dbi-connection-pool/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-dbi
	dev-lisp/cl-syntax
	dev-lisp/bt-semaphore
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r dbi-cp-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
