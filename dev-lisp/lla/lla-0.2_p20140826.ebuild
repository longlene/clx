# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b116166f5b4713df560aef8ff8087799161269b6"

DESCRIPTION="Lisp Linear Algebra"
HOMEPAGE="https://github.com/tpapp/lla"
SRC_URI="https://github.com/tpapp/lla/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-num-utils
	dev-lisp/cl-slice
	dev-lisp/let-plus
	virtual/blas
	virtual/lapack
	test? ( dev-lisp/clunit )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem lla-tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
