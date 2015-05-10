# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit common-lisp-3 git-2

DESCRIPTION="An implementation of Python in Common Lisp"
HOMEPAGE="http://common-lisp.net/project/clpython/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/metawilm/cl-python.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/closer-mop
dev-lisp/cl-yacc
test? ( dev-lisp/ptester )"

src_install() {
	common-lisp-install-sources compiler contrib lib parser runtime shared util *.lisp
	common-lisp-install-sources -t all test
	common-lisp-install-asdf ${PN}.asd
	dodoc README.md
}
