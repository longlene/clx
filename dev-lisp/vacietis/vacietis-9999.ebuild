# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="a C compiler for Common Lisp systems."
HOMEPAGE="https://github.com/vsedach/Vacietis"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vsedach/Vacietis.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/named-readtables
dev-lisp/anaphora
dev-lisp/babel
dev-lisp/cl-ppcre
dev-lisp/cl-fad
dev-lisp/trivial-dump-core"

