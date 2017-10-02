# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b2232120e5b6dde8591cf45e2d75ade9e55b3eb"

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
	eapply_user
	use test || rm -rf rutils-test.asd rutilsx-test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}