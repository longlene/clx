# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="50bd4f09b5a03a7249bd4d78265d6451563b25ad"

DESCRIPTION="Super micro framework for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/ningle"
SRC_URI="https://github.com/fukamachi/ningle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/myway
	dev-lisp/clack
	dev-lisp/cl-syntax
	dev-lisp/alexandria
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd tests
}

