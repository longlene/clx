# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Web application environment for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/clack"
SRC_URI="https://github.com/fukamachi/clack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-types
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/split-sequence
	dev-lisp/cl-syntax
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/ironclad
	dev-lisp/rfc2388
	dev-lisp/flexi-streams
	dev-lisp/local-time
	dev-lisp/circular-streams
	dev-lisp/multival-plist
	dev-lisp/bordeaux-threads
	dev-lisp/yason
	dev-lisp/cl-base64
	dev-lisp/marshal
	dev-lisp/lack
"

