# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="CFFI bindings to libcurses"
HOMEPAGE="http://gitorious.org/cl-charms"
SRC_URI=""

#EGIT_REPO_URI="https://git.gitorious.org/cl-charms/cl-charms.git"
EGIT_REPO_URI="https://github.com/eudoxia0/cl-charms.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/ncurses
dev-lisp/cffi
dev-lisp/alexandria
"
src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all version.lisp-expr
	common-lisp-install-asdf ${PN}.asd
	if use example ; then
		common-lisp-install-sources examples
		common-lisp-install-asdf ${PN}-timer.asd ${PN}-paint.asd
	fi
	dodoc README.md
}
