# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Lisp NLP tool-set"
HOMEPAGE="https://github.com/vseloved/cl-nlp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vseloved/cl-nlp.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/rutils
dev-lisp/cl-ppcre
dev-lisp/cgn"
