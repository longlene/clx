# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9bbb6ef60ceade9ba46d4be24d062436c479d79a"

DESCRIPTION="Reader Syntax Coventions for Common Lisp and SLIME"
HOMEPAGE="https://github.com/lisp-maintainers/cl-syntax"
SRC_URI="https://github.com/lisp-maintainers/cl-syntax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

