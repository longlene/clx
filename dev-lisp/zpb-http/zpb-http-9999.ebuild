# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="a Common Lisp http library"
HOMEPAGE="https://github.com/xach/zpb-http"
SRC_URI=""

EGIT_REPO_URI="git@github.com:xach/zpb-http.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/sbcl"

