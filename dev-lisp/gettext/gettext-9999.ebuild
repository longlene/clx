# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="A port of gettext runtime to Common Lisp"
HOMEPAGE="https://github.com/copyleft/gettext"
SRC_URI=""

EGIT_REPO_URI="https://github.com/copyleft/gettext.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/split-sequence
dev-lisp/cl-yacc
dev-lisp/flexi-streams"

