# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc83f0f9ddc39fd152df15521188b57162c4669f"

DESCRIPTION="Asynchronous operations for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-async"
SRC_URI="https://github.com/orthecreedence/cl-async/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-libuv
	dev-lisp/cl-ppcre
	dev-lisp/fast-io
	dev-lisp/trivial-features
	dev-lisp/static-vectors
	dev-lisp/trivial-gray-streams
	dev-lisp/uiop
	dev-lisp/vom
	test? ( dev-lisp/fiveam dev-lisp/usocket dev-lisp/flexi-streams dev-lisp/ironclad )
"

src_prepare() {
	use test || rm -r test cl-async-test.asd
}