# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp 3D/2D Graphics Engine for OpenGL"
HOMEPAGE="https://github.com/BradWBeer/CLinch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/BradWBeer/CLinch.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-opengl
dev-lisp/sb-cga
x11-libs/pango
x11-libs/cairo
media-libs/freeimage"

