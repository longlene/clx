# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4e08d82d7c8fb1b8fc708c87f4d9d13a1ab490cb"

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
	default
	use test || rm -rf ${PN}-youtube-tests.asd youtube-tests.lisp
}
