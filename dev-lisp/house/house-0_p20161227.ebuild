# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="51ed4058c79d49d1eb95b48dbe10395b388c04b1"

DESCRIPTION="Minimal asynchronous CL web server"
HOMEPAGE="https://github.com/Inaimathi/house"
SRC_URI="https://github.com/Inaimathi/house/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/cl-json
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fad
	dev-lisp/usocket
	dev-lisp/optima
	dev-lisp/flexi-streams
	dev-lisp/lisp-unit"
