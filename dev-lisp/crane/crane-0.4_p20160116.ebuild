# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a85295d7ea0d13d74822dd835d8abfada4b1685"

DESCRIPTION="An ORM for Common Lisp"
HOMEPAGE="http://eudoxia0.github.io/crane/"
SRC_URI="https://github.com/eudoxia0/crane/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/anaphora
	dev-lisp/sxql
	dev-lisp/cl-dbi
	dev-lisp/iterate
	dev-lisp/cl-fad
	dev-lisp/clos-fixtures
	dev-lisp/uiop
	dev-lisp/local-time
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
