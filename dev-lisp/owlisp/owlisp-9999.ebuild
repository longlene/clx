# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="owlisp is a front end of LLVM"
HOMEPAGE="http://github.com/olivermg/owlisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/olivermg/owlisp.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/cl-ppcre
>=sys-devel/llvm-3.4"

src_install() {
	sed -i 's/3\.2/3\.4/' src/compiler/llvm-ir/cffi/loader.lisp

	rm -rf tests
	rm make.lisp
	common-lisp-3_src_install
}
