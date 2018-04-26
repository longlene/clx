# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5e2f5ef08d69cc9e958b24092a1db47b29e55aff"

DESCRIPTION="Web application environment for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/clack"
SRC_URI="https://github.com/fukamachi/clack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lack
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/uiop
	dev-lisp/drakma
	dev-lisp/local-time
	dev-lisp/trivial-backtrace
	dev-lisp/marshal
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/quri
	dev-lisp/trivial-mimes
	dev-lisp/trivial-types
	dev-lisp/http-body
	dev-lisp/flexi-streams
	dev-lisp/circular-streams
	dev-lisp/ironclad
	dev-lisp/cl-syntax
	dev-lisp/split-sequence
	dev-lisp/anaphora
	dev-lisp/cl-fad
	dev-lisp/rfc2388
	dev-lisp/multival-plist
	dev-lisp/yason
	test? ( dev-lisp/prove )
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
