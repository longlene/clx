# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Library Documentation Hosting for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/quickdocs"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/quickdocs.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-annot
dev-lisp/flexi-streams
dev-lisp/alexandria
dev-lisp/cl-emb
dev-lisp/cl-markdown
dev-lisp/trivial-shell
dev-lisp/cl-fad
dev-lisp/yason
dev-lisp/drakma
dev-lisp/memoize
dev-lisp/trivial-backtrace
dev-lisp/clack
dev-lisp/ningle
dev-lisp/local-time
dev-lisp/split-sequence"

