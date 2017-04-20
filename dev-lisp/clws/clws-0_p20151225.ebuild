# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4ff713f001c0959ffb8946f76beebd744a50624f"

DESCRIPTION="websockets server in CL"
HOMEPAGE="https://github.com/deadtrickster/clws"
SRC_URI="https://github.com/deadtrickster/clws/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

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

