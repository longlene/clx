# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="373b245b928c1a5cce91a6cb5bfe5dd77eb36195"

DESCRIPTION="Optimized Pattern Matching Library for Common Lisp"
HOMEPAGE="https://github.com/m2ym/optima"
SRC_URI="https://github.com/m2ym/optima/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	test? ( dev-lisp/eos )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd test
}

