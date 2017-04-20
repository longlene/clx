# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dcbeb589c312119070f20edc85cdf3f4153bc60d"

DESCRIPTION="A Common Lisp HTTP Client"
HOMEPAGE="https://github.com/svenvc/s-http-client"
SRC_URI="https://github.com/svenvc/s-http-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/chipz"

