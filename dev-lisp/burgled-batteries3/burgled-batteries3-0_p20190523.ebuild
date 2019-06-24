# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f65f454d13bb6c40e17e9ec62e41eb5069e09760"

DESCRIPTION="A bridge between Python3 and Lisp"
HOMEPAGE="https://github.com/snmsts/burgled-batteries3"
SRC_URI="https://github.com/snmsts/burgled-batteries3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/parse-declarations
	dev-lisp/trivial-garbage
	dev-lisp/cl-fad
	test? ( dev-lisp/lift dev-lisp/cl-quickcheck )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd t ${PN}-demo.asd
}
