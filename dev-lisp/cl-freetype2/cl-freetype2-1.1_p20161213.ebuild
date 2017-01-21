# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3

EGIT_COMMIT="ee04cea2db29e72e2843794c3b8c20676cf2ce0a"

DESCRIPTION="Common Lisp bindings for Freetype 2"
HOMEPAGE="https://github.com/rpav/cl-freetype2"
SRC_URI="https://github.com/rpav/cl-freetype2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/cl-who
	dev-lisp/cl-markdown
"

src_prepare() {
	use test || rm -rf ${PN}-tests.asd t
}
