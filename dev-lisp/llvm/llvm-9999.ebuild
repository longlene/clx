# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="CFFI bindings for LLVM"
HOMEPAGE="https://github.com/sellout/CL-LLVM"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sellout/CL-LLVM.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/trivial-features
sys-devel/llvm"

