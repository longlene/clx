# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="f446835b4104896e0eed6a61d2ceb4ad22f589d8"

DESCRIPTION="An implementation of base58 for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/cl-base58"
SRC_URI="https://github.com/eudoxia0/cl-base58/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
