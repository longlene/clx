# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c71fce5d340a8280e2fedc4ce41635ff27488750"

DESCRIPTION="A Common Lisp implementation of the Cassowary constraint solving toolkit"
HOMEPAGE="https://github.com/Shinmera/classowary"
SRC_URI="https://github.com/Shinmera/classowary/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd
}
