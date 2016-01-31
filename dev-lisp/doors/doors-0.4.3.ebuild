# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="MS Windows API from Common Lisp perspective"
HOMEPAGE="https://github.com/Lovesan/doors"
SRC_URI="https://github.com/Lovesan/doors/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-features
dev-lisp/alexandria
dev-lisp/virgil
dev-lisp/trivial-garbage
dev-lisp/closer-mop
dev-lisp/bordeaux-threads"

