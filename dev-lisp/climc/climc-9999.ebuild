# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp Instant Messaging Client"
HOMEPAGE="https://github.com/nlamirault/climc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nlamirault/climc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/mcclim
dev-lisp/cl-xmpp
dev-lisp/cl-ppcre"

