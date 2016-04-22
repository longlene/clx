# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Reasonable Utilities package for Common Lisp"
HOMEPAGE="https://github.com/mabragor/rutils"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vseloved/rutils.git"

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
