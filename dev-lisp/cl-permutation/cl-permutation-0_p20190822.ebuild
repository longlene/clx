# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="631b17541ad9fb5e2fbf89b09bc0d5a98d718e1c"

DESCRIPTION="A library for operating on permutations and permutation groups"
HOMEPAGE="https://github.com/stylewarning/cl-permutation"
SRC_URI="https://github.com/stylewarning/cl-permutation/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/cl-algebraic-data-type
	dev-lisp/closer-mop
	dev-lisp/bordeaux-fft
	test? ( dev-lisp/fiasco )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd ${PN}-examples.asd tests examples
}
