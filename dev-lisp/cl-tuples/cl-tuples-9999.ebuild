# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Libray for writing optimised vector math in Common Lisp"
HOMEPAGE="https://github.com/Ferada/cl-tuples http://repo.or.cz/w/cl-tuples.git"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Ferada/cl-tuples.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/lexical-rename
dev-lisp/alexandria"

