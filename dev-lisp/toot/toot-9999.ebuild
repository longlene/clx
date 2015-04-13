# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Toot is a stripped down and, hopefully, simplified version of Edi Weitz's Hunchentoot"
HOMEPAGE="https://github.com/gigamonkey/toot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/toot.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/chunga
dev-lisp/cl-base64
dev-lisp/cl-fad
dev-lisp/cl-ppcre
dev-lisp/flexi-streams
dev-lisp/cl-plus-ssl
dev-lisp/md5
dev-lisp/trivial-backtrace
dev-lisp/usocket
dev-lisp/bordeaux-threads
dev-lisp/puri
dev-lisp/sbcl"

