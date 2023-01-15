# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f02e58312654ddf19d686f234dcf699fc4cd0f5"

DESCRIPTION="Data frames for Common Lisp"
HOMEPAGE="https://github.com/Lisp-Stat/data-frame"
SRC_URI="https://github.com/Lisp-Stat/data-frame/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/array-operations
	dev-lisp/numerical-utilities
	dev-lisp/select
	dev-lisp/let-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:data-frame\/tests/,$d' ${PN}.asd
	rm ${PN}-tests.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
