# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2
DESCRIPTION="lambda-reader lets you use λ instead of LAMBDA to define anonymous functions."
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="git://common-lisp.net/users/frideau/lambda-reader.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/named-readtables"

