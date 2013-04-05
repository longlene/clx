# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp REST Package"
HOMEPAGE="https://github.com/svenvc/s-rest"
SRC_URI=""

EGIT_REPO_URI="https://github.com/svenvc/s-rest.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/s-http-client
dev-lisp/s-http-server
dev-lisp/cl-who"

