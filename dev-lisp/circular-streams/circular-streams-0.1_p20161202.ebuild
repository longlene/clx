# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e770bade1919c5e8533dd2078c93c3d3bbeb38df"

DESCRIPTION="Circularly readable streams for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/circular-streams"
SRC_URI="https://github.com/fukamachi/circular-streams/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="amd64 x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-annot
dev-lisp/cl-syntax
dev-lisp/trivial-gray-streams"

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

