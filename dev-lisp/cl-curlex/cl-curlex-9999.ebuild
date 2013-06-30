# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Leak *LEXENV* variable from compilation into runtime"
HOMEPAGE="https://github.com/mabragor/cl-curlex"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mabragor/cl-curlex.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/eos
dev-lisp/iterate"

