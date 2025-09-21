# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="c29a464a14e1b111debec44eec516f0001a21f9f"

DESCRIPTION="Lisp Interface Library"
HOMEPAGE="https://github.com/fare/lisp-interface-library"
SRC_URI="https://github.com/fare/lisp-interface-library/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/fare-memoization
	dev-lisp/fare-utils
"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.text
}
