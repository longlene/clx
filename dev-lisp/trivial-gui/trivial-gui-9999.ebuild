# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Lisp GUI for OpenGL canvas using Vecto and Glop"
HOMEPAGE="https://github.com/johnfredcee/trivial-gui"
SRC_URI=""

EGIT_REPO_URI="https://github.com/johnfredcee/trivial-gui.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/glop
dev-lisp/cl-opengl
dev-lisp/vecto
dev-lisp/iterate"

