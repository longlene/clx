# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="coleslaw: A Flexible Lisp Blogware"
HOMEPAGE="https://github.com/redline6561/coleslaw"
SRC_URI=""

EGIT_REPO_URI="git://github.com/redline6561/coleslaw.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3bmd
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/inferior-shell
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
"

src_prepare() {
	eapply_user
	use test || rm tests ${PN}-test.asd
}
