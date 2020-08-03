# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp MySQL library"
HOMEPAGE="http://hackinghat.com/index.php/cl-mysql"
SRC_URI=""

EGIT_REPO_URI="https://github.com/hackinghat/cl-mysql.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi"

