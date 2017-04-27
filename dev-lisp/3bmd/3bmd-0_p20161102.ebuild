# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b301ade30d5cbaf76c5b53d35d2482850cdeb1b"

DESCRIPTION="markdown processor in CL using esrap parser"
HOMEPAGE="https://github.com/3b/3bmd"
SRC_URI="https://github.com/3b/3bmd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/esrap
	dev-lisp/split-sequence
	dev-lisp/colorize
	dev-lisp/uiop
	test? ( dev-lisp/fiasco )
"

src_prepare() {
	use test || rm -rf ${PN}-youtube-tests.asd youtube-tests.lisp
}
