# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Common Lisp binding for the zeromq messaging library"
HOMEPAGE="https://github.com/galdor/lisp-zmq"
SRC_URI="https://github.com/galdor/lisp-zmq/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/bordeaux-threads
net-libs/zeromq"

