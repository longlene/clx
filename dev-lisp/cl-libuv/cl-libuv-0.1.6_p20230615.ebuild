# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2ec76dc8b2ae0e21340a3059bb080e31d87cc043"

DESCRIPTION="Libuv bindings for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-libuv"
SRC_URI="https://github.com/orthecreedence/cl-libuv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
	dev-lisp/alexandria
	dev-lisp/cffi
"

