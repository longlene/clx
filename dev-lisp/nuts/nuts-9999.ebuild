# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Non-Unit Test Suite -- a test library for Common Lisp"
HOMEPAGE="https://github.com/vseloved/nuts"

EGIT_REPO_URI="https://github.com/vseloved/nuts.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/closer-mop
dev-lisp/rutils
dev-lisp/clsql"
#dev-lisp/nuts-trivial"
