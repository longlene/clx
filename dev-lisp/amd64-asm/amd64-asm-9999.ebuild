# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="AMD64 assembler in Common Lisp"
HOMEPAGE="https://github.com/rayiner/amd64-asm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rayiner/amd64-asm.git"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate"

