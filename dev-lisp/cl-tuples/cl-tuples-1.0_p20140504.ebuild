# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0a0560227f8d97311a297805706fcfb19d7a0b8d"

DESCRIPTION="Libray for writing optimised vector math in Common Lisp"
HOMEPAGE="https://github.com/Ferada/cl-tuples http://repo.or.cz/w/cl-tuples.git"
SRC_URI="https://github.com/Ferada/cl-tuples/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-tests.asd tests
}
