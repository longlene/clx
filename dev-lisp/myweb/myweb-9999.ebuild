# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="myweb - simple web server written in Common Lisp"
HOMEPAGE="https://github.com/LinkFly/myweb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/LinkFly/myweb.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
app-emacs/slime
dev-lisp/usocket
dev-lisp/bordeaux-threads
dev-lisp/local-time
dev-lisp/cl-log
dev-lisp/trivial-utf8"

