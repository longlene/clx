# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp port of the Chipmunk 2d physics library"
HOMEPAGE="https://github.com/sykopomp/squirl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sykopomp/squirl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-games/chipmunk
dev-lisp/cl-opengl
dev-lisp/lispbuilder-sdl"

