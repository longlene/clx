# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="Search Engine Interface for Common Lisp"
HOMEPAGE="https://github.com/tkych/quicksearch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/quicksearch.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/anaphora
dev-lisp/alexandria
dev-lisp/cl-ppcre
dev-lisp/drakma
dev-lisp/yason
dev-lisp/flexi-streams
dev-lisp/do-urlencode
dev-lisp/html-entities
dev-lisp/bordeaux-threads"

