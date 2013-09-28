# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Spawn local or remote processes and shell pipes from Lisp."
HOMEPAGE="http://common-lisp.net/gitweb?p=projects/qitab/inferior-shell.git"
SRC_URI=""

EGIT_REPO_URI="http://common-lisp.net/r/projects/qitab/inferior-shell.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/asdf
dev-lisp/xcvb
dev-lisp/fare-quasiquote
dev-lisp/fare-mop
dev-lisp/fare-utils
dev-lisp/optima"

