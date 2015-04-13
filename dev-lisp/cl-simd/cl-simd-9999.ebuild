# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="SSE intrinsics implementation for ECL & SBCL"
HOMEPAGE="https://github.com/angavrilov/cl-simd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/angavrilov/cl-simd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

