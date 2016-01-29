# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Asynchronous operations for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-async"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-async.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
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
"

src_prepare() {
	use test || rm -r test cl-async-test.asd
}
