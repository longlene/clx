# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Norvig's sudoku solver in Common Lisp"
HOMEPAGE="https://github.com/tkych/cl-sudoku"

EGIT_REPO_URI="https://github.com/tkych/cl-sudoku.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-ppcre"
