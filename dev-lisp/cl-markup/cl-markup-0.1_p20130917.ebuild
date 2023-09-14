# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e0eb7debf4bdff98d1f49d0f811321a6a637b390"

DESCRIPTION="Modern markup (HTML) generation library for Common Lisp"
HOMEPAGE="https://github.com/arielnetworks/cl-markup"
SRC_URI="https://github.com/arielnetworks/cl-markup/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	use test || rm -r ${PN}-test.asd test
}

