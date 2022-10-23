# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a9db7a764e142ebd2a5bb8c31090855cc13acff2"

DESCRIPTION="Parallelism for Common Lisp"
HOMEPAGE="https://github.com/lmj/lparallel"
SRC_URI="https://github.com/sharplispers/lparallel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

src_prepare() {
	default
	rm -rf ${PN}-bench.asd bench
	use test || rm -rf ${PN}-test.asd test
}

