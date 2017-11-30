# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bfb1aeb2b3dc12b43a001af3a56946dece9b07c5"

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
	dev-lisp/defpackage-plus
	dev-lisp/uiop
	dev-lisp/trivial-features
	dev-util/c2ffi
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all autowrap-libffi/spec
}
