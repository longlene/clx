# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b670c9730971431f2c712941d17003b5dffb1c2d"

DESCRIPTION="Generate modern project skeletons"
HOMEPAGE="https://github.com/fukamachi/cl-project"
SRC_URI="https://github.com/fukamachi/cl-project/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-emb
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/prove
	dev-lisp/uiop
	test? ( dev-lisp/caveman2 )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
