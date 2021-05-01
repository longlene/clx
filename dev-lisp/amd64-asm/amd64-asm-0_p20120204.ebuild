# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="27ac3e683557d691cd68472c94d110f32334f61a"

DESCRIPTION="AMD64 assembler in Common Lisp"
HOMEPAGE="https://github.com/rayiner/amd64-asm"
SRC_URI="https://github.com/rayiner/amd64-asm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate"

