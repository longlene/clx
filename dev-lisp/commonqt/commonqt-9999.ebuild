# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2 multilib qmake-utils

DESCRIPTION="A Common Lisp binding to the smoke library for Qt"
HOMEPAGE="https://common-lisp.net/project/commonqt"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stassats/commonqt.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
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
dev-lisp/bordeaux-threads"

src_configure() {
	eqmake4 || die "configure failed"
}

src_compile() {
	emake || die "compile failed"
}
