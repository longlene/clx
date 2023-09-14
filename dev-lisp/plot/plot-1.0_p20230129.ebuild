# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a26cb0ed92245d06d531ffe14d8ebf01f9e86506"

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
	dev-lisp/clppcre
	dev-lisp/alexandria
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
