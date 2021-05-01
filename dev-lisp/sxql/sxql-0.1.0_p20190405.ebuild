# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ca3e737bd32df6c910d3d46bc57057fa65184d40"

DESCRIPTION="A SQL generator for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/sxql"
SRC_URI="https://github.com/fukamachi/sxql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/optima
	dev-lisp/iterate
	dev-lisp/cl-syntax
	dev-lisp/trivial-types
	dev-lisp/split-sequence
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
