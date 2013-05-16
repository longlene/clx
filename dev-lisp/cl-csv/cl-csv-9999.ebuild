# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A common lisp library providing easy csv reading and writing"
HOMEPAGE="https://github.com/blindglobe/cl-csv"
SRC_URI=""

EGIT_REPO_URI="https://github.com/blindglobe/cl-csv.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/alexandria
dev-lisp/cl-interpol"

