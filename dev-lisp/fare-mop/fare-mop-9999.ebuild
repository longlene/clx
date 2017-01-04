# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="fare-mop: utilities depending on closer-mop"
HOMEPAGE="http://www.cliki.net/fare-mop"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fare/fare-mop.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fare-utils
	dev-lisp/uiop
	dev-lisp/closer-mop
"

