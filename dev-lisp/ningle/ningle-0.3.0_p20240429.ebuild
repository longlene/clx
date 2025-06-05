# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ae0c79bbd7c71633268fe3130ed4f12ca4be2f9a"

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

