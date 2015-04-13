# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp HTTP Server"
HOMEPAGE="https://github.com/svenvc/s-http-server"
SRC_URI=""

EGIT_REPO_URI="https://github.com/svenvc/s-http-server.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/s-utils
dev-lisp/s-sysdeps
dev-lisp/s-base64
dev-lisp/puri
dev-lisp/salza2"

