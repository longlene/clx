# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A simple project skeleton generator for Restas projects"
HOMEPAGE="https://github.com/pvlpenev/restas-project"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pvlpenev/restas-project.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-interpol
dev-lisp/cl-fad
dev-lisp/alexandria"

