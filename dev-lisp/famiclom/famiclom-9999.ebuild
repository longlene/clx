# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="An NES Emulator"
HOMEPAGE="https://github.com/redline6561/famiclom"
SRC_URI=""

EGIT_REPO_URI="https://github.com/redline6561/famiclom.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl6502
dev-lisp/romreader
dev-lisp/lispbuilder-sdl"

