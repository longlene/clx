# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="eXtensible Component Verifier and Builder for Common-Lisp"
HOMEPAGE="http://common-lisp.net/project/xcvb/"

EGIT_REPO_URI="git://github.com/fare/xcvb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/fare-mop
dev-lisp/fare-memoization
dev-lisp/uiop"
