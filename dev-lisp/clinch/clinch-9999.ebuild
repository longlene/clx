# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp 3D/2D Graphics Engine for OpenGL"
HOMEPAGE="https://github.com/BradWBeer/CLinch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/BradWBeer/CLinch.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emacs/slime
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-cairo2
	dev-lisp/cl-freeimage
	dev-lisp/cl-opengl
	dev-lisp/cl-pango
	dev-lisp/cl-sdl2
	dev-lisp/classimp
	dev-lisp/rtg-math
	dev-lisp/trivial-channels
	dev-lisp/trivial-garbage
	dev-lisp/xmls
"

