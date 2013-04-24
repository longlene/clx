# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Parallelism for Common Lisp"
HOMEPAGE="https://github.com/lmj/lparallel"
SRC_URI="https://github.com/lmj/lparallel/archive/lparallel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/bordeaux-threads"

S="${WOKRDIR}/lparallel-lparallel-${PV}"
