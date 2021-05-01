# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a25f6234898c2fc28382e8e037e0de3f8f3a04e3"

DESCRIPTION="Cl-voxelize is a library to convert polygon models into voxel models for particle-based physics simulation"
HOMEPAGE="https://github.com/takagi/cl-voxelize"
SRC_URI="https://github.com/takagi/cl-voxelize/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	example? ( dev-lisp/ply )
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-examples.asd examples
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
