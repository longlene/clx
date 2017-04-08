# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a07018011484ff1e16bb758644292edd0efe386"

DESCRIPTION="An evented webserver for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/wookie"
SRC_URI="https://github.com/orthecreedence/wookie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/blackbird
	dev-lisp/cl-async
	dev-lisp/cl-ppcre
	dev-lisp/babel
	dev-lisp/chunga
	dev-lisp/fast-http
	dev-lisp/qrui
	dev-lisp/do-urlencode
	dev-lisp/cl-fad
	dev-lisp/fast-io
	dev-lisp/vom
"
