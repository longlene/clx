# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4854aa9d64beaedeb1c2d0af16ec3ffe69447829"

DESCRIPTION="BSON encoder/decoder for Common Lisp"
HOMEPAGE="http://euandre.org/cl-BSON"
SRC_URI="https://github.com/EuAndreh/cl-BSON/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/arrow-macros
	dev-lisp/babel
	dev-lisp/cl-intbytes
	dev-lisp/fast-io
	dev-lisp/ieee-floats
	dev-lisp/let-over-lambda
	dev-lisp/local-time
	dev-lisp/named-readtables
	dev-lisp/rutils
	dev-lisp/trivial-shell
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
