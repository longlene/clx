# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7e68a4ede00d3d3168796372930807acb8405783"

DESCRIPTION="Database independent interface for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/cl-dbi"
SRC_URI="https://github.com/fukamachi/cl-dbi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/split-sequence
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
	dev-lisp/cl-sqlite
	dev-lisp/cl-mysql
	dev-lisp/postmodern
	dev-lisp/trivial-garbage
	test? ( dev-lisp/prove dev-lisp/trivial-types )
"

src_prepare() {
	default
	use test || rm -r t dbi-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
