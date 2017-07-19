# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6350ca755e071394f5f5e6f31c7ade75d12f7785"

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
	dev-lisp/bordeaux-threads
	dev-lisp/flexi-streams
	test? ( dev-lisp/should-test )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ #:cl-redis-test/,$d' ${PN}.asd
		rm test.lisp
	fi
}

