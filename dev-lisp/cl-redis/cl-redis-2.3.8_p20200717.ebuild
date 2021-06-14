# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7d592417421cf7cd1cffa96043b457af0490df7d"

DESCRIPTION="Redis client for Common Lisp"
HOMEPAGE="https://github.com/vseloved/cl-redis"
SRC_URI="https://github.com/vseloved/cl-redis/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rutils
	dev-lisp/cl-ppcre
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/babel
	test? ( dev-lisp/should-test dev-lisp/bordeaux-threads )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem\ #:cl-redis-test/,$d' ${PN}.asd
		rm test.lisp
	fi
}

