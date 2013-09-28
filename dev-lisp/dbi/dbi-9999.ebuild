# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Database independent interface for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/cl-dbi"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/cl-dbi.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-syntax
dev-lisp/split-sequence
dev-lisp/closer-mop"

