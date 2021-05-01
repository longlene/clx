# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Norvig's sudoku solver in Common Lisp"
HOMEPAGE="https://github.com/tkych/cl-sudoku"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/cl-sudoku.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre"

