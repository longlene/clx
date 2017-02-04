# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 multilib qmake-utils vcs-snapshot

EGIT_COMMIT="6ceee90ede708c7a30fe2c9f03bc6232dcb448e1"

DESCRIPTION="A Common Lisp binding to the smoke library for Qt"
HOMEPAGE="https://common-lisp.net/project/commonqt"
SRC_URI="https://github.com/commonqt/commonqt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	kde-base/smokeqt
	dev-lisp/trivial-features
	dev-lisp/cffi
	dev-lisp/named-readtables
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/iterate
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
"

src_configure() {
	eqmake4
}

src_compile() {
	emake
}
