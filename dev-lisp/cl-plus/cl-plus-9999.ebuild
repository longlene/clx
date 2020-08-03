# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="((CL+)):Interface for Prototyping"
HOMEPAGE="https://github.com/tkych/cl-plus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/cl-plus.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/trivial-types
dev-lisp/split-sequence
dev-lisp/named-readtables"
