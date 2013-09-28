# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Bridge for parsing c2ffi JSON into CFFI"
HOMEPAGE="https://github.com/rpav/c2ffi-cffi/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/c2ffi-cffi.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+example"

DEPEND=""
RDEPEND="${DEPEND}
dev-util/c2ffi
dev-lisp/alexandria
dev-lisp/cffi
dev-lisp/optima
dev-lisp/cl-json
dev-lisp/cl-ppcre"

