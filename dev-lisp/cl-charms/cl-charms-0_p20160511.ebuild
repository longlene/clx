# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="06859f597189f36bf0ebc6acadddf2247c0234f6"

DESCRIPTION="CFFI bindings to libcurses"
HOMEPAGE="http://gitorious.org/cl-charms"
SRC_URI="https://github.com/HiTECNOLOGYs/cl-charms/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/ncurses
	dev-lisp/cffi
	dev-lisp/alexandria
"

src_prepare() {
	use example || rm -r ${PN}-paint.asd ${PN}-timer.asdf examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr
}
