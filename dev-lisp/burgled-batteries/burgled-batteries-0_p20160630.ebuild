# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8ae3815a52fde36e68e54322cd7da2c42ec09f5c"

DESCRIPTION="A bridge between Python and Lisp"
HOMEPAGE="https://github.com/pinterface/burgled-batteries"
SRC_URI="https://github.com/pinterface/burgled-batteries/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
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

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd t
}
