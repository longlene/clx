# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Circularly readable streams for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/circular-streams"
SRC_URI="https://github.com/fukamachi/circular-streams/archive/0.1.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="amd64 x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-annot
dev-lisp/cl-syntax
dev-lisp/trivial-gray-streams"

