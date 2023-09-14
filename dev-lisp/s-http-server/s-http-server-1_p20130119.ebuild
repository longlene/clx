# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bd7df615080d19c9a0dab18d7f543edf7a7fd3e2"

DESCRIPTION="A Common Lisp HTTP Server"
HOMEPAGE="https://github.com/svenvc/s-http-server"
SRC_URI="https://github.com/svenvc/s-http-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/s-utils
	dev-lisp/s-sysdeps
	dev-lisp/s-base64
	dev-lisp/puri
	dev-lisp/salza2
"

