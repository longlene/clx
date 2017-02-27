# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4717b690d21a3388bec3a4a271d2dcb7cdb561ce"

DESCRIPTION="ML-like Pattern Matching for Common Lisp"
HOMEPAGE="https://github.com/arielnetworks/cl-pattern"
SRC_URI="https://github.com/arielnetworks/cl-pattern/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-annot
	dev-lisp/cl-syntax
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd ${PN}-benchmark.asd test etc
}
