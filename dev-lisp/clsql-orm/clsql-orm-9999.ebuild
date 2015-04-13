# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="A common lisp object / relational mapping library"
HOMEPAGE="https://github.com/AccelerationNet/CLSQL-ORM"
SRC_URI=""

EGIT_REPO_URI="https://github.com/AccelerationNet/clsql-orm.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/clsql
dev-lisp/cl-ppcre
dev-lisp/cl-interpol
dev-lisp/cl-inflector
dev-lisp/symbol-munger
dev-lisp/iterate"

