# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A fast HTTP request/response parser for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/fast-http"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/fast-http.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-utilities
dev-lisp/babel
dev-lisp/xsubseq
dev-lisp/log4cl"

# TODO
# long-description may read error in gentoo
