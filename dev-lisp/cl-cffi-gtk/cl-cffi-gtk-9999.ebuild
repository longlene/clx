# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Lisp binding to the GTK+-3"
HOMEPAGE="http://gitorious.org/lisp-projects/cl-gtk"
SRC_URI=""

EGIT_REPO_URI="https://github.com/crategus/cl-cffi-gtk.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/bordeaux-threads
dev-lisp/closer-mop
dev-lisp/trivial-garbage
dev-lisp/iterate
x11-libs/gtk+
x11-libs/pango
x11-libs/cairo"


src_install() {
	rm -rf lisp-utils
	rm -rf tutorial/figures/*.pdf
	common-lisp-3_src_install

	dodir /usr/share/${PN}/{tutorial,demo,tests}
	cp -rf  "${S}"/tutorial/* "${ED}"/usr/share/${PN}/tutorial
	cp -rf  "${S}"/demo/* "${ED}"/usr/share/${PN}/demo
	cp -rf  "${S}"/tests/* "${ED}"/usr/share/${PN}/tests
	dodoc INSTALL
}
