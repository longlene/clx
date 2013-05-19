# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="An evented webserver for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/wookie"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/wookie.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-async-future
dev-lisp/cl-async
dev-lisp/cl-ppcre
dev-lisp/babel
dev-lisp/chunga
dev-lisp/http-parse
dev-lisp/prui
dev-lisp/local-time
dev-lisp/do-urlencode
dev-lisp/cl-fad
dev-lisp/zsort"
