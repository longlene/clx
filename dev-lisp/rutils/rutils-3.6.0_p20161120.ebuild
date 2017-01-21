# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3

EGIT_COMMIT="a1117a6441fee0303f89781ebe07a95045233619"

DESCRIPTION="Reasonable Utilities package for Common Lisp"
HOMEPAGE="https://github.com/mabragor/rutils"
SRC_URI="https://github.com/vseloved/rutils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	test? ( dev-lisp/should-test )
"

src_prepare() {
	use test || rm -rf rutils-test.asd rutilsx-test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}
