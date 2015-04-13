# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Arc compatible package"
HOMEPAGE="https://github.com/g000001/arc-compat"
SRC_URI=""

EGIT_REPO_URI="https://github.com/g000001/arc-compat.git"

LICENSE="Aritstic License 2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fiveam
dev-lisp/named-readtables
dev-lisp/bordeaux-threads
dev-lisp/ironclad
dev-lisp/cl-fad"

