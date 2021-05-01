# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80328800d047fef9b6e32dfe6bdc98396aee3cc9"

DESCRIPTION="Dynamic testing for Common Lisp"
HOMEPAGE="https://github.com/rpav/CheckL"
SRC_URI="https://github.com/rpav/CheckL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/marshal
	doc? ( dev-lisp/cl-gendoc )
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use doc || rm -r ${PN}-docs.asd doc
	use test || rm -r ${PN}-test.asd t
}
