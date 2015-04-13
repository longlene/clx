# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="ESRAP -- a packrat parser for Common Lisp"
HOMEPAGE="git://github.com/nikodemus/esrap.git"
SRC_URI=""

EGIT_REPO_URI="git://github.com/nikodemus/esrap.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"

