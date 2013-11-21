# Distributed under the terms of the GNU General Public License v2

EAPI=4

inhrit common-lisp-3 git-2

DESCRIPTION="A SQL generator for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/sxql"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/sxql.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/optima
dev-lisp/cl-syntax-annot
dev-lisp/trivial-types
dev-lisp/split-sequence"

