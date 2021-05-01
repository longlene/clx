# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d5ab125b389008696a66f5a0d1bbb7449584db90"

DESCRIPTION="Common Lisp port of the Chipmunk 2d physics library"
HOMEPAGE="https://github.com/sykopomp/squirl"
SRC_URI="https://github.com/sykopomp/squirl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-games/chipmunk
	dev-lisp/cl-opengl
"

