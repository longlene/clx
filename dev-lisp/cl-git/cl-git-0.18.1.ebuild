# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="a Common Lisp CFFI interface to the libgit2 library"
HOMEPAGE="https://github.com/russell/cl-git"
SRC_URI="https://github.com/russell/cl-git/archive/${PV}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/local-time
dev-lisp/cl-fad
dev-lisp/trivial-garbage
dev-lisp/anaphora
dev-lisp/alexandria
dev-lisp/closer-mop"

