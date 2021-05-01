# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="eXtensible Component Verifier and Builder for Common-Lisp"
HOMEPAGE="http://common-lisp.net/project/xcvb/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/fare/xcvb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fare-mop
dev-lisp/fare-memoization
dev-lisp/uiop"

