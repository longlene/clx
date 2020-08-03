# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-r3 common-lisp-3

DESCRIPTION="Parse atom and rss feeds in Common Lisp"
HOMEPAGE="https://github.com/tkych/cl-feed-parser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/cl-feed-parser.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/anaphora
dev-lisp/alexandria
dev-lisp/puri
dev-lisp/flexi-streams
dev-lisp/ironclad
dev-lisp/sanitize
dev-lisp/cl-date-time-parser"

