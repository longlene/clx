# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Rpc4cl is an implementation of XML-RPC for Common Lisp"
HOMEPAGE="http://code.stiernstrom.se/rpc4cl"
SRC_URI="http://code.stiernstrom.se/rpc4cl/downloads/rpc4cl-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/drakma
dev-lisp/cxml
dev-lisp/cl-ppcre
dev-lisp/parse-number
dev-lisp/rfc3339-timestamp
dev-lisp/babel
dev-lisp/trivial-timeout"

