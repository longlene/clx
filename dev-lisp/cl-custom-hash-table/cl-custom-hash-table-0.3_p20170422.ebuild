# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5c60f370d8629b20de982cf98118d0d19dd538f8"

DESCRIPTION="Custom hash tables for Common Lisp"
HOMEPAGE="https://github.com/metawilm/cl-custom-hash-table"
SRC_URI="https://github.com/metawilm/cl-custom-hash-table/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test-package.lisp test-suite.lisp
}
