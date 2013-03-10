# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Reader Syntax Coventions for Common Lisp and SLIME"
HOMEPAGE="https://github.com/m2ym/cl-syntax"
SRC_URI=""

EGIT_REPO_URI="https://github.com/m2ym/cl-syntax.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-types
dev-lisp/named-readtables
dev-lisp/cl-annot
dev-lisp/cl-anonfun
"

