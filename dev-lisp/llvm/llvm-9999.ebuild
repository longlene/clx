# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="CFFI bindings for LLVM"
HOMEPAGE="https://github.com/sellout/CL-LLVM"

EGIT_REPO_URI="https://github.com/sellout/CL-LLVM.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/trivial-features
llvm-core/llvm"
