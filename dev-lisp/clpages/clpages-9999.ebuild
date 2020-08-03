# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Generates an index from a directory containing html files"
HOMEPAGE="https://github.com/acieroid/clpages"
SRC_URI=""

EGIT_REPO_URI="https://github.com/acieroid/clpages.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/cl-ppcre
dev-lisp/html-template
dev-lisp/local-time
dev-lisp/xmls"

