# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="a Common Lisp http library"
HOMEPAGE="https://github.com/xach/zpb-http"

EGIT_REPO_URI="git@github.com:xach/zpb-http.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/sbcl"
