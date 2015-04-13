# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A python notebook-esque thing for Common Lisp"
HOMEPAGE="https://github.com/Inaimathi/cl-notebook"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Inaimathi/cl-notebook.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora
dev-lisp/house
dev-lisp/fact-base
dev-lisp/parenscript
dev-lisp/cl-fad
dev-lisp/cl-who
dev-lisp/cl-css
dev-lisp/closer-mop"

