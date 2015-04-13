# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Import c2ffi specs and generate CFFI wrappers"
HOMEPAGE="https://github.com/rpav/cl-autowrap"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/cl-autowrap.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cffi
dev-lisp/cl-json
dev-lisp/cl-ppcre
dev-lisp/external-program
dev-lisp/trivial-features"

