# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="websockets server in CL"
HOMEPAGE="https://github.com/deadtrickster/clws"
# original 3b/clws
SRC_URI=""

EGIT_REPO_URI="https://github.com/deadtrickster/clws.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="sbcl"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/safe-queue
	dev-lisp/iolib
	dev-lisp/fast-http
	dev-lisp/quri
	dev-lisp/eventfd
	dev-lisp/ironclad
	dev-lisp/chunga
	dev-lisp/cl-base64
	dev-lisp/flexi-streams
	dev-lisp/split-sequence
	dev-lisp/ia-hash-table
	dev-lisp/log4cl
	dev-lisp/trivial-backtrace
	dev-lisp/blackbird
"

