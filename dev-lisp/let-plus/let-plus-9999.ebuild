# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="destructuring extension of let*"
HOMEPAGE="https://github.com/tpapp/let-plus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tpapp/let-plus.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora"

