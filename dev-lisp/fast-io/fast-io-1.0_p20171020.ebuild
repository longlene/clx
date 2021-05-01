# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dc3a71db7e9b756a88781ae9c342fe9d4bbab51c"

DESCRIPTION="Fast octet-vector/stream I/O for Common Lisp"
HOMEPAGE="https://github.com/rpav/fast-io"
SRC_URI="https://github.com/rpav/fast-io/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-gray-streams
	dev-lisp/static-vectors
	test? ( dev-lisp/checkl )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}
