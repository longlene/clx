# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3

DESCRIPTION="High-performance Transactional Memory for Common Lisp"
HOMEPAGE="http://stmx.org"
SRC_URI="https://github.com/cosmos72/stmx/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/log4cl
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-garbage
"

