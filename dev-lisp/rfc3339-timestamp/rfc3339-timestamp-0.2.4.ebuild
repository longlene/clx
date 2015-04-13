# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="A RFC3339 timestamp library for Common Lisp"
HOMEPAGE="http://code.stiernstrom.se/rfc3339-timestamp"
SRC_URI="http://code.stiernstrom.se/rfc3339-timestamp/downloads/rfc3339-timestamp-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-yacc"

