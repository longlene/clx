# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit common-lisp-3 git-2

DESCRIPTION="An implementation of Python in Common Lisp"
HOMEPAGE="http://common-lisp.net/project/clpython/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/franzinc/cl-python.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-yacc
dev-lisp/closer-mop
test? ( dev-lisp/ptester )"

