# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp compiler for the strftime language"
HOMEPAGE="https://github.com/ruricolist/cl-strftime"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ruricolist/cl-strftime.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/serapeum
dev-lisp/cl-ppcre
dev-lisp/local-time
"

