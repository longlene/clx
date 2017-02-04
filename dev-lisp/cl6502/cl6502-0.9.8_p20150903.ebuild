# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0fbce82c55a63df0ceaf17d6e3d952219514a949"

DESCRIPTION="A 6502 emulator in Lisp"
HOMEPAGE="https://github.com/kingcons/cl-6502"
SRC_URI="https://github.com/kingcons/cl-6502/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/fiveam
"

