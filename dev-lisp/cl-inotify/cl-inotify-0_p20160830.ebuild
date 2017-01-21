# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2bcef82a6ec761be946e484c2c9f9ce0a626dc1a"

DESCRIPTION="Common Lisp interface to the Linux inotify API"
HOMEPAGE="https://github.com/Ferada/cl-inotify"
SRC_URI="https://github.com/Ferada/cl-inotify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/binary-types
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/trivial-utf8
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-tests.asd tests
}
