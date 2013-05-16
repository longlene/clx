# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Trivial portability for raw *nix IO in Common Lisp"
HOMEPAGE="https://github.com/redline6561/trivial-raw-io"
SRC_URI=""

EGIT_REPO_URI="https://github.com/redline6561/trivial-raw-io.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"

