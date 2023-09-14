# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ad8f88101f491d169149afb047eefa44a39c8d6"

DESCRIPTION="A web crawling framework in Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/arachne"
SRC_URI="https://github.com/eudoxia0/arachne/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/plump
	dev-lisp/clss
	dev-lisp/xpath
	dev-lisp/cxml-stp
	dev-lisp/trivial-types
	dev-lisp/local-time
	dev-lisp/cl-mop
	test? ( dev-lisp/fiveam dev-lisp/lucerne )
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

