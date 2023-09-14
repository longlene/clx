# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a195e99e5226818dd4ddcb4281c1ccecdc1b35a4"

DESCRIPTION="Encode/decode any-base integers and byte arrays interchangeably"
HOMEPAGE="https://github.com/EuAndreh/cl-intbytes"
SRC_URI="https://github.com/EuAndreh/cl-intbytes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
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
