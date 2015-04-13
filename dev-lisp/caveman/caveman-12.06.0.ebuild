# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="A micro web framework for Common Lisp based on Clack"
HOMEPAGE="http://fukamachi.github.io/caveman/"
SRC_URI="https://github.com/fukamachi/caveman/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/clack
dev-lisp/anaphora
dev-lisp/cl-ppcre
dev-lisp/cl-syntax
dev-lisp/cl-fad
dev-lisp/cl-emb
dev-lisp/local-time
dev-lisp/cl-project"

