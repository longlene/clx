# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Generate modern project skeletons"
HOMEPAGE="https://github.com/fukamachi/cl-project"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/cl-project.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/anaphora
dev-lisp/cl-emb
dev-lisp/cl-fad
dev-lisp/cl-ppcre
dev-lisp/cl-annot
dev-lisp/cl-syntax
dev-lisp/local-time"

src_prepare() {
	sed -i -e '36,48s/^/;/' -e '$a)' ${PN}.asd
}
