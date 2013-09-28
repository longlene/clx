# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="date and time library for common lisp"
HOMEPAGE="https://github.com/quek/simple-date-time"
SRC_URI=""

EGIT_REPO_URI="https://github.com/quek/simple-date-time.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre"

