# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Ruby Parser for Common Lisp"
HOMEPAGE="https://github.com/m2ym/ruby-parser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/m2ym/ruby-parser.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/iterate
dev-lisp/anaphora
dev-lisp/optima
dev-lisp/lyacc
dev-lisp/cl-ppcre
dev-lisp/closer-mop
dev-lisp/parse-number"

