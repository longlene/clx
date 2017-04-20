# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6fa9c82bc15b6bd6f249d72a38f0d7422ed06332"

DESCRIPTION="Import c2ffi specs and generate CFFI wrappers"
HOMEPAGE="https://github.com/rpav/cl-autowrap"
SRC_URI="https://github.com/rpav/cl-autowrap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/uiop
	dev-lisp/trivial-features
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}
