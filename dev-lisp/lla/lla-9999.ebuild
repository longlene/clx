# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Lisp Linear Algebra"
HOMEPAGE="https://github.com/tpapp/lla"
SRC_URI=""

EGIT_URI_REPO="https://github.com/tpapp/lla.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/anaphora
dev-lisp/alexandria
dev-lisp/cffi
dev-lisp/cl-num-utils
dev-lisp/cl-slice
dev-lisp/let-plus
virtual/blas
virtual/lapack"

