# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp interface to unix rlimit"
HOMEPAGE="https://github.com/guicho271828/cl-rlimit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/cl-rlimit.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi"


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
