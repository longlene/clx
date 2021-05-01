# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e6ca2aa13dadcdd1f72866ea0b16f72818478cc1"

DESCRIPTION="Common Lisp binding for clBLAS"
HOMEPAGE="https://github.com/gos-k/cl-clblas"
SRC_URI="https://github.com/gos-k/cl-clblas/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="
	dev-lisp/cffi
	sci-libs/clblas
	test? ( dev-lisp/cffi dev-lisp/cl-oclapi )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
