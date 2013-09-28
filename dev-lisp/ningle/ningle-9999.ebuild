# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A lightweight web application framework for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/ningle"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/ningle.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/clack
dev-lisp/cl-syntax"

src_prepare() {
	# remove the static file dependency
	sed -i -e '31,43s/^/;/' -e '$a)' ningle.asd
}
