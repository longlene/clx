# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Parallelism for Common Lisp"
HOMEPAGE="https://github.com/lmj/lparallel"
SRC_URI="mirror://github/lmj/lparallel/archive/lparallel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="benchmark"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/bordeaux-threads"

S="${WORKDIR}"/lparallel-lparallel-${PV}

src_prepare() {
	if ! use benchmark; then
		rm -rf lparallel-bench.asd bench
	fi
}
