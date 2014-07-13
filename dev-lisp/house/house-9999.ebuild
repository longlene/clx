# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Minimal asynchronous CL web server"
HOMEPAGE="https://github.com/Inaimathi/house"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Inaimathi/house.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora
dev-lisp/cl-base64
dev-lisp/cl-ppcre
dev-lisp/cl-json
dev-lisp/bordeaux-threads
dev-lisp/cl-fad
dev-lisp/usocket
dev-lisp/optima
dev-lisp/flexi-streams
dev-lisp/lisp-unit"
