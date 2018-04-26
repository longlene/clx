# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="84b2d3ded91a9769369237d2c5afc3327eb3ec6f"

DESCRIPTION="Libuv bindings for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-libuv"
SRC_URI="https://github.com/orthecreedence/cl-libuv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
	dev-lisp/alexandria
	dev-lisp/cffi
"

