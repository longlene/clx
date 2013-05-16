# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Optimized Pattern Matching Library for Common Lisp"
HOMEPAGE="https://github.com/m2ym/optima"
SRC_URI="https://github.com/m2ym/optima/archive/v0.1.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/closer-mop"

