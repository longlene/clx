# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d1f7f9591f8a91e542a00f2de4126bad9ca23457"

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
	use test || rm -r ${PN}-test.asd t
}
