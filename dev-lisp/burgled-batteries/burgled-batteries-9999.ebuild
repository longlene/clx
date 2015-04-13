# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A bridge between Python and Lisp"
HOMEPAGE="https://github.com/pinterface/burgled-batteries"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pinterface/burgled-batteries.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/alexandria
dev-lisp/parse-declarations
dev-lisp/trivial-garbage
dev-lisp/cl-fad"

