# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="S-Expressions for XML generation"
HOMEPAGE="https://github.com/madnificent/SEXML"
SRC_URI=""

EGIT_REPO_URI="https://github.com/madnificent/SEXML.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/alexandria
dev-lisp/cxml
dev-lisp/contextl
dev-lisp/macroexpand-dammit"

src_install() {
	dodoc readme.textile && rm readme.textile
	common-lisp-install-sources -t all contrib/ *.dtd *.lisp
	common-lisp-install-asdf
}
