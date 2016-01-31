# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp driver for MongoDB"
HOMEPAGE="https://github.com/archimag/mongo-cl-driver"
SRC_URI="https://github.com/archimag/mongo-cl-driver/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/closer-mop
dev-lisp/local-time
dev-lisp/babel
dev-lisp/ieee-floats
dev-lisp/ironclad
dev-lisp/bordeaux-threads
dev-lisp/cl-async-future
dev-lisp/cl-async
dev-lisp/usocket"

