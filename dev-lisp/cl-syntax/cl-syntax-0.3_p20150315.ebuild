# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="03f0c329bbd55b8622c37161e6278366525e2ccc"

DESCRIPTION="Reader Syntax Coventions for Common Lisp and SLIME"
HOMEPAGE="https://github.com/m2ym/cl-syntax"
SRC_URI="https://github.com/m2ym/cl-syntax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-types
dev-lisp/named-readtables
dev-lisp/cl-annot
dev-lisp/cl-anonfun"

