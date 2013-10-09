# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp Wrapper for the SDL 2.0 C Library"
HOMEPAGE="https://github.com/lispgames/cl-sdl2"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lispgames/cl-sdl2.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-autowrap
dev-lisp/cl-ppcre
dev-lisp/trivial-garbage
dev-lisp/cl-opengl
media-libs/libsdl2"

