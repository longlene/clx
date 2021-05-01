# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c8f9c99d224e73792ba9d089ec828ecbcfaf0b46"

DESCRIPTION="Common Lisp implementation of Google's Snappy data compression library"
HOMEPAGE="https://github.com/brown/snappy"
SRC_URI="https://github.com/brown/snappy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/base
	dev-lisp/nibbles
	dev-lisp/protobuf
	test? ( dev-lisp/random dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd snappy_test.lisp snappy_bench.lisp testdata
}
