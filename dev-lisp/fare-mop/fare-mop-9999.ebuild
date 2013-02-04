# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="fare-mop: utilities depending on closer-mop"
HOMEPAGE="http://www.cliki.net/fare-mop"
SRC_URI=""

EGIT_REPO_URI="http://common-lisp.net/r/users/frideau/fare-mop.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fare-utils
dev-lisp/asdf-driver
dev-lisp/closer-mop"

