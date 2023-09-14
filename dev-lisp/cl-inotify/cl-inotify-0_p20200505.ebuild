# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2884850d90637b4b0096e57419c7fcbe39891d16"

DESCRIPTION="Common Lisp interface to the Linux inotify API"
HOMEPAGE="https://github.com/ralt/cl-inotify"
SRC_URI="https://github.com/ralt/cl-inotify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	default
	use test || rm -rf ${PN}-tests.asd tests
}
