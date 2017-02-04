# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5011f53cdad54bffd0bb59a53b770fc4f40c33bd"

DESCRIPTION="An NES Emulator"
HOMEPAGE="https://github.com/kingcons/famiclom"
SRC_URI="https://github.com/kingcons/famiclom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl6502
	dev-lisp/romreader
	dev-lisp/lispbuilder-sdl
	dev-lisp/optima
"

