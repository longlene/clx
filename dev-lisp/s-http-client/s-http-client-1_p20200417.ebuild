# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a604cef79498009ebcc7dc14878473d4dbcf7cc5"

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

