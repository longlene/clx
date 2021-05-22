# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="de0d2e7d9af67b4a31f9dda5da2f3fbb0cb1099b"

DESCRIPTION="A plotting system for Common Lisp"
HOMEPAGE="https://github.com/Lisp-Stat/plot"
SRC_URI="https://github.com/Lisp-Stat/plot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lass
	dev-lisp/cl-who
	dev-lisp/alexandria
	dev-lisp/select
	dev-lisp/iterate
	dev-lisp/cl-spark
	dev-lisp/yason
	dev-lisp/let-plus
	dev-lisp/dfio
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :plot\/tests/,$d' ${PN}.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
