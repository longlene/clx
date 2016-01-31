# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Parallelism for Common Lisp"
HOMEPAGE="https://github.com/lmj/lparallel"
SRC_URI="https://github.com/lmj/lparallel/archive/lparallel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/bordeaux-threads
test? ( dev-lisp/trivial-garbage )
"

S="${WORKDIR}"/lparallel-lparallel-${PV}

src_install() {
	common-lisp-install-sources src
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources test bench
		common-lisp-install-asdf ${PN}-test.asd ${PN}-bench.asd
	fi
	dodoc README.md
}
