# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="765156a67f0de38e7ed43d7a0936df258d7f2e05"

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
