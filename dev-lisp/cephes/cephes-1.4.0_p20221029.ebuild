# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fbe35f0d2d8429a50faec1032c0ab90d571833d3"

DESCRIPTION="Wrapper for the Cephes Mathematical Library"
HOMEPAGE="https://github.com/lisp-stat/cephes.cl"
SRC_URI="https://github.com/lisp-stat/cephes.cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""

src_compile() {
	emake -C scipy-cephes
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp scipy-cephes/libmd.so
}
