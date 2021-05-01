# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A Common Lisp Interface to Java"
HOMEPAGE="http://common-lisp.net/project/cl-plus-j/"
SRC_URI="http://common-lisp.net/project/cl-plus-j/releases/cl+j-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/trivial-garbage
dev-lisp/bordeaux-threads"

