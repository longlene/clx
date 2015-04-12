# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A library providing a foundation for computational mathematics, science, and engineering"
HOMEPAGE="http://repo.or.cz/w/antik.git"
SRC_URI=""

EGIT_REPO_URI="http://repo.or.cz/r/antik.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/alexandria
dev-lisp/split-sequence
dev-lisp/cl-ppcre
dev-lisp/cffi
dev-lisp/trivial-garbage
dev-lisp/drakma"
# static-vectors 
