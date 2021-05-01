# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec3b2aae3a768bed738d825a0c7e2394a3d6622a"

DESCRIPTION="OpenCL binding for Common Lisp"
HOMEPAGE="https://github.com/guicho271828/eazy-opencl"
SRC_URI="https://github.com/guicho271828/eazy-opencl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/trivia
	dev-lisp/iterate
	virtual/opencl
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
