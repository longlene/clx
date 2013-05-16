# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A 6502 emulator in Lisp"
HOMEPAGE="https://github.com/redline6561/cl-6502"
SRC_URI=""

EGIT_REPO_URI="https://github.com/redline6561/cl-6502.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-ppcre"

CLPACKAGE="cl-6502"

