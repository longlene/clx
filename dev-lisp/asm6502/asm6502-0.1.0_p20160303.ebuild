# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="343c893f0b086d8e4e47c7245cc1d3d288918fee"

DESCRIPTION="6502 Assembler and NES toys in Common Lisp"
HOMEPAGE="https://github.com/ahefner/asm6502"
SRC_URI="https://github.com/ahefner/asm6502/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

