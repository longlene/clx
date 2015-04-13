# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="An ORM for Common Lisp"
HOMEPAGE="http://eudoxia0.github.io/crane/"
SRC_URI=""

EGIT_URI="https://github.com/eudoxia0/crane.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/closer-mop
dev-lisp/anaphora
dev-lisp/sxql
dev-lisp/dbi
dev-lisp/iterate
dev-lisp/cl-annot
dev-lisp/cl-fad
dev-lisp/clos-fixtures"

