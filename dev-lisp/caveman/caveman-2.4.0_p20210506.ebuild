# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f6ae0fe20bca5ba75a8bc5dcaea8cf59f12c2da5"

DESCRIPTION="A micro web framework for Common Lisp based on Clack"
HOMEPAGE="http://fukamachi.github.io/caveman/"
SRC_URI="https://github.com/fukamachi/caveman/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ningle
	dev-lisp/lack
	dev-lisp/cl-project
	dev-lisp/cl-dbi
	dev-lisp/cl-syntax
	dev-lisp/myway
	dev-lisp/quri
	dev-lisp/sxql
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	rm -rf ${PN}-test.asd ${PN}.asd v1
	use test || rm -r ${PN}2-test.asd v2/t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
