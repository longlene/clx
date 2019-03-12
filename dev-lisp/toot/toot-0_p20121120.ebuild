# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

EGIT_COMMIT="90f3854f2e548c9ad102c53caba834255dfabfa2"

DESCRIPTION="A web server created by stripping down and reorganizing hunchentoot"
HOMEPAGE="https://github.com/gigamonkey/toot"
SRC_URI="https://github.com/gigamonkey/toot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

