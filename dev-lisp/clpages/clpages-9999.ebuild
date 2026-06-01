# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Generates an index from a directory containing html files"
HOMEPAGE="https://github.com/acieroid/clpages"

EGIT_REPO_URI="https://github.com/acieroid/clpages.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/cl-ppcre
dev-lisp/html-template
dev-lisp/local-time
dev-lisp/xmls"
