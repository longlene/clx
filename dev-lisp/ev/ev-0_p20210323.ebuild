# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f6c7621d86a8993a7fa992a747598b2fe5f6cd2b"

DESCRIPTION="libev bindings for Common Lisp"
HOMEPAGE="https://github.com/sbryant/cl-ev"
SRC_URI="https://github.com/sbryant/cl-ev/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
"

