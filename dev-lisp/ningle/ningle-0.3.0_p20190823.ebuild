# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a9052827757c54a83c9648175c11530e79295513"

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
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd tests
}

