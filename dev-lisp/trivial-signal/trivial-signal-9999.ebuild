# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="UNIX signal handling library for Common Lisp"
HOMEPAGE="https://github.com/guicho271828/trivial-signal"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/trivial-signal.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/bordeaux-threads"


# TODO
# remove the with-open-file


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
