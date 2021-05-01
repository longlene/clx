# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3
DESCRIPTION="lambda-reader lets you use λ instead of LAMBDA to define anonymous functions."
HOMEPAGE="http://cliki.net/lambda-reader"
SRC_URI=""

EGIT_REPO_URI="git://common-lisp.net/users/frideau/lambda-reader.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/named-readtables"

