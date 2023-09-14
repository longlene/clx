# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Property List stores multiple values per one key"
HOMEPAGE="https://github.com/fukamachi/multival-plist"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/multival-plist.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-annot
dev-lisp/cl-syntax
dev-lisp/trivial-types
dev-lisp/alexandria"

